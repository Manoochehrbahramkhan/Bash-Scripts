#!/bin/bash

clear
echo "#######################################################################################################################################
#                                                        Date : 1402/11/10                                                            #
#                                                        Create by Manoocehhr Bahramkhan					      #
#                                                        mail:manoochehrbahramkhan@gmail.com					      #
#######################################################################################################################################"
red_notic() {
	tput setaf 1
	echo "$1"
	tput sgr0
}

green_notic() {
	tput setaf 2
	echo "$1"
	tput sgr0
}

yellow_notic() {
	tput setaf 3
	echo "$1"
	tput sgr0
}

blue_notic() {
	tput setaf 12
	echo "$1"
	tput sgr0
}

menu_view() {
	blue_notic '1) System up time!'
	sleep 1
	echo
	blue_notic '2) System update and upgarde'
	sleep 1
	echo
	blue_notic '3) Make swap file'
	sleep 1
	echo
	blue_notic '4) Renew SSL'
	sleep 1
	echo
	blue_notic '5) Proccess status'
	sleep 1
	echo
	blue_notic '6) Monitor Memory'
	sleep 1
	echo
	blue_notic '7) Monitor Disk Space'
	sleep 1
	echo
	blue_notic '8) Useradd (As sudoer!!!)'
	sleep 1
	echo
	blue_notic '9) Check SSL'
	sleep 1
	echo
	blue_notic '10) Monitor Networking'
	sleep 1
	echo
	blue_notic '11) Update Usefull package'
	sleep 1
	echo
	blue_notic 'q) Exit'
	echo
}

SWAP_PATH="/swapfile"
TEST=`echo $?`

Firewall_CONF () {
	ufw status
	ufw enable
	ufw allow 'OPEN SSH'
	ufw allow 'NGINX FULL'
	ufw allow 8293
}

SWAP_SYS () {
	echo
	yellow_notic 'Making Swap...'
	echo
	sleep 1
	sudo fallocate -l ${SWAP_SIZE}G ${SWAP_PATH}
	sudo chmod 600 $SWAP_PATH
	sudo mkswap $SWAP_PATH
	sudo swapon $swap_PATH
	echo "$SWAP_PATH	none	swap	sw	o	0" >> /etc/fstab
	echo
	green_notic 'SWAP Created sccessfully.'
	echo 
	free -mh
	sleep 0.5
}

installtion() {
echo
yellow_noticc Installing Usefull Package ...
echo
sleep 0.5
sudo apt -y install apt-transport-https iptables iptables-persistent nftables
sudo apt -y apt-utils bash-completion busybox ca-certificates cron curl gnupg2 locales lsb_release preload screen  software-properties-common ufw unzip vim wget xvd zip
sudo apt -y install bc binutils binutils-common binutils-x86-64-linux-gnu ubuntu-keyring haveged jq libsodium-dev libsqllite3-dev libssl-dev packagekit qrencode socat
sudo apt -y install dialog htop net-tools bmon
sudo apt -y install autoconf automake bash-completion build-essential git libtool make pkg-config python3 python3-pip
echo
green_notic 'Usefl Package Installed Successfully!'
echo
sleep 0.5
}

while true ;do
	sleep 2
	echo
	if [[ $UID -ne 0 ]];then
		red_notic 'You dont have permission!!!'
		exit 1
	fi
	menu_view
	read -p "Please Enter Your Choice: " choise
	echo
	case $choise in
		1) date=`timedatectl` && yellow_notic "$date"  ;;

		2) sudo apt update && sudo apt upgrade -y ;;

		3) blue_notic 'How Many Space do you need for Swapfile(GB)? '
		       read SWAP_SIZE
		       rm -rf /swapfile 
		SWAP_SYS ;;		

		4)cp /home/iauec/ec* /etc/nginx/ssl
			sudo systemctl restart nginx ;;
		
		5) top ;;
		6) mem=`free -mh` && yellow_notic "$mem" ;;
		7) df -Th ;;
		8) read -p "name of user: " name
			useradd -d /home/$name -m -G root -g root -s /bin/bash $name
			passwd $name
			echo "$name ALL=(ALL:ALL) ALL" >> /etc/sudoers
			sleep 0.5
			if [ $TEST -eq 0 ] ;then
				green_notic 'Crate user successfully'
			else
				red_notic 'faild to create user!'
			fi ;;
			
		9) read -p "Please Enter Your Domain to check SSL: " ssl
			data=`echo | openssl s_client -servername $ssl -connect $ssl:443 2>/dev/null | openssl $enssl x509 -noout -enddate | sed -e 's#notAfter=##'`

			ssldate=`date -d "${data}" '+%s'`
			nowdate=`date '+%s'`
			diff="$((${ssldate}-${nowdate}))"

			yellow_notic "$((${diff}/86400)) Days Left To Expire!";;
		10) ip addr | grep inet
			red_notic "#############################################################################################################################################"
		    ip r ;;

		11) installtion	;;    
		q) exit ;;
	esac
done
