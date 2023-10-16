# ruby-rails-terraform
This is to deploy Infrastructure along with ruby web application deployment on ECS EC2 launch type.

Inorder to execute terraform code, the place where you are cloning/running the scripts requires below things,
1. Git binary needs to be installed on AWS Amazon Linux machine to clone the code from Git to the machine.

 sudo yum install -y git
2. Terraform binary needs to be present on the machine to execute terraform code.

sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
3. Docker must be presented to make dockerized image
sudo yum -y install docker
sudo service docker start
sudo usermod -a -G docker ec2-user 
sudo chkconfig docker on 
pip3 install docker-compose
4. AWSCLI needs to be exist on the 

sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
5. Also, the EC2 instace should have privilege and trust other services in aws. We call it as "Assume Role". The role needs to be exist and attached to the EC2 instance as profile.
   
Click on the EC2 instance that you wanted to assign an IAM role >> Select EC2 instance >> Action >> Security >> Modify IAM Role >> Choose IAM role if already exist.
