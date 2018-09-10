#!/bin/sh

sudo yum update -y
sudo yum install -y docker-18.03* ruby-2.0* awscli-1.14* python3-pip-9.0*
sudo systemctl enable docker
sudo service docker start
sudo usermod -aG docker ec2-user
sudo pip3 install 'docker-compose==1.22.*'
aws configure set aws_access_key_id ${aws_access_key}
aws configure set aws_secret_access_key ${aws_secret_access_key}
aws configure set default.region ${aws_region}
cd /home/ec2-user
aws s3 cp s3://aws-codedeploy-${aws_region}/latest/install . --region ${aws_region}
sudo chmod +x install
sudo ./install auto
sudo rm -f install
sudo service codedeploy-agent start