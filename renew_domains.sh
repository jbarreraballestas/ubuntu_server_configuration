#!/bin/bash
ENDCOLOR="\e[0m"
YELLOW="\e[33m"
RED="\e[31m"
GREEN="\e[32m"
maindomain='interactivo.net.co'
certsdirectory='/etc/letsencrypt/live'
appdirectory='/var/www/html/mkt'
certfilename='cert.pem'
# First generate domains file
domains='domains.txt'
domainsconf='domains.conf'
currentdir=`pwd -P`
currentmonth=`date +"%m"`
currentday=`date +"%d"`
serverip=`curl -s ifconfig.me/ip`
logfile='renew.log'
cat /dev/null > "$logfile"
if [[ -f "$domains" ]]; then
    while read line; do
        domain=${line}
        if [[ "$domain" == "$maindomain" ]] || [[ "$domain" == *"$maindomain"* ]]; then
            echo "Main domain or subdomain $domain: manual renew with wildcard for subdomains" >> "$logfile"
        else
          echo "Checking domain $domain for renew"  >> "$logfile"
          if test -f "$certsdirectory/$domain/$certfilename"; then
            while read -r line
            do
                if [[ "$line" == *"notAfter"* ]]; then
                    month=`echo ${line#*=} | awk '{print $1;}'`
                    day=`echo ${line#*=} | awk '{print $2;}'`
                    month=`date --date="$(printf "01 %s" $month)" +"%m"`
                    if [ "$month" -le "$currentmonth" ] && [ "$day" -le "$currentday" ] ;then
                      echo "Expired cert: $month-$day < $currentmonth-$currentday"  >> "$logfile"
                    else
                      echo "Cert for $domain exist and valid to $day $month "  >> "$logfile"
                    fi
                fi
            done < <(sudo openssl x509 -dates -noout -in $certsdirectory/$domain/$certfilename)
          else
            echo "Certificate for $domain not exist" >> "$logfile"
            ipdomain=`dig $domain A +short`
            if [[ "$ipdomain" != "$serverip" ]]; then
              echo "The domain $domain not pointing to $serverip -> $ipdomain received" >> "$logfile"
            else
              echo "The domain $domain pointing to $serverip -> $ipdomain successfull create cert" >> "$logfile"
              certstatus=`sudo certbot certonly --webroot -w $appdirectory -d $domain`
              echo "$certstatus" >> "$logfile"
              if [[ "$certstatus" == *"Successfully received certificate"* ]]; then
                echo "The cert for domain $domain was created successfull"
                echo "<VirtualHost *:443>
ServerName $domain
DocumentRoot $appdirectory
SSLCertificateFile /etc/letsencrypt/live/$domain/fullchain.pem
SSLCertificateKeyFile /etc/letsencrypt/live/$domain/privkey.pem
</VirtualHost>" > "$domain.conf"
                echo "Include $currentdir/$domain.conf
                " >> "$domainsconf"
              else
                echo "The cert for $domain cannot be created" >> "$logfile"
              fi
            fi
          fi
        fi
        # echo $domain;
    done < $domains
else
    echo "The file $domains not exists, nothing to do" >> "$logfile"
fi
