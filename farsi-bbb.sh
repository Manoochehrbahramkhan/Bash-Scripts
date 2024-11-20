#!/bin/bash
green="\033[32m"
reset="\033[0m"
sudo apt install bbb-webhooks -y
if [[ $? -eq 0 ]];then
        echo -e "${green} webhooks install! ${reset}"
#pannel farsi

cd /root/greenlight
docker-compose down

wait

cd /root/greenlight-v3
docker exec -it greenlight-v3 bundle exec rake admin:create["admin","email@example.com","user","password"]

sed -i '81iDEFAULT_LOCALE=fa_IR' /root/greenlight-v3/.env
sed -i 's/overrideLocale: null/overrideLocale: fa/g' /usr/share/meteor/bundle/programs/server/assets/app/config/settings.yml
docker-compose down
docker-compose up -d
wait

cp /home/iauec/default.pdf /var/www/bigbluebutton-default/assets
sleep 2
echo "recordFullDurationMedia=true" | tee -a /etc/bigbluebutton/bbb-web.properties

if [[ $? == 0 ]];then
        echo -e "${green} your system will be reboot in 3s ${reset}"
        sleep 3
        reboot
fi
