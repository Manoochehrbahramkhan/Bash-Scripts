#! /usr/bin/env bash
menu() {
    echo "nameserver 10.202.10.202" > /etc/resolv.conf
    sudo apt update

    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update

    #apt-cache policy docker-ce

    sudo apt install docker-ce -y
    wait
    sudo systemctl enable --now docker
    sudo systemctl status docker
}
menu
while true
do
        if [[ $? -ne 0 ]]; then
                menu
        fi
done
