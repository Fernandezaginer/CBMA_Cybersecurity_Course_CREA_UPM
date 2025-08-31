#!/bin/bash


create_service() {
    local service_file=$1
    local service_name=$2
    chmod +x $service_file
    echo "
    [Unit]
    Description=Example $service_name
    [Service]
    ExecStart=$service_file
    [Install]
    WantedBy=multi-user.target
    " | sudo tee /etc/systemd/system/$service_name.service > /dev/null
    sudo systemctl start $service_name.service
    sudo systemctl enable $service_name.service
}




# Update package manager:
sudo apt-get update -y
sudo apt-get upgrade -y


# Generic installs:
sudo apt-get install net-tools htop -y

# Allow internal packet forwarding:
echo 1 > /proc/sys/net/ipv4/ip_forward

# Download course materials:
git clone https://github.com/Fernandezaginer/CBMA_Cybersecurity_Course_CREA_UPM





# SESION 2: Security in Networks

# Install firewall:
sudo apt-get install iptables -y

# Install web server
sudo apt-get install nodejs npm -y
sudo npm install -g http-server
create_service "sudo http-server -p 80" "http-server-example"

# Install SSH server
sudo apt-get install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh

# Install fail2ban service
sudo apt-get install fail2ban -y

# Install nmap scanner
sudo apt-get install nmap -y

# Install wireshark sniffer
sudo apt-get install wireshark -y

# Install hping3 and apache2-utils tool for DoS
sudo apt-get install hping3 apache2-utils -y

# Install bettercap for MITM
sudo apt-get install bettercap -y


# # Install setollkit
# sudo apt install git python3-pip -y
# git clone https://github.com/trustedsec/social-engineer-toolkit.git
# cd social-engineer-toolkit
# pip3 install -r requirements.txt
# sudo python3 setup.py





# SESION 3: Security in Software

sudo snap install docker -y
sudo usermod -aG docker $USER


# Install python 3.12
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update -y
sudo apt install python3.12 -y

# Malware service:
create_service $(pwd)/script_auxiliar/malware/spyware_example.sh "malware"




