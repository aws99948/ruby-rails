#!/bin/bash
sudo yum update 
sudo yum -y install docker
sudo service docker start
sudo usermod -a -G docker ec2-user 
sudo chkconfig docker on 
pip3 install docker-compose
sudo apt install unzip -y
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
reboot