# IaC with Terraform

## Tested version and architecture

* Terraform **v0.11.8**;
* Linux 64-bit; 

## Installation

* **AWS Permissions**: **Full Admin**;
* **GitHub Personal Access Token for Deployment** (`GITHUB_TOKEN`). 
For more details, [GitHub Docs - Creating a Personal Access Token for the Command Line](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)

* **AWS Credentials** and **GITHUB_TOKEN** environment variables:

```
export AWS_ACCESS_KEY_ID=AKIA...
export AWS_SECRET_ACCESS_KEY=V0BUy....
export AWS_DEFAULT_REGION=us-east-...
export GITHUB_TOKEN=f030ef...
```

## Download and Initialize Terraform

```
export TF_VERSION=0.11.8
export TF_ARCH=linux_amd64
wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_${TF_ARCH}.zip
unzip terraform_${TF_VERSION}_${TF_ARCH}.zip
rm -f terraform_${TF_VERSION}_${TF_ARCH}.zip
./terraform init
```

## Deploy Infrastructure

### Create VPC in specific region

* Example: VPC in **N. Virginia** (*us-east-1*):

```sh
./iac-helper.sh us-east-1 apply
```

### Destroy VPC

```sh
./iac-helper.sh us-east-1 destroy
```

## Created Resources for each region

* 1 **VPC**;
* 4 **Subnets** {public_subnet_primary, public_subnet_secondary, public_subnet_tertiary, private_subnet_primary};
* 1 **Internet Gateway**;
* 3 **Route Table** {web_public_rt_primary, web_public_rt_secondary, web_public_rt_tertiary};
* 3 **Route Table Association** {web_public_rt_primary, web_public_rt_secondary, web_public_rt_tertiary};
* 1 **Security Group** {app_prod_sg};
* 1 **Launch Template** {app_prod_launch_template};
* 1 **Auto Scaling Group** {asg_app_prod};
* 1 **CodeDeploy Application** {app};
* 1 **CodeDeploy Deployment Group** {app-prod};