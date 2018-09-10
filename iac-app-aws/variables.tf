variable "aws_region" {
  description = "AWS region on which we will setup the swarm cluster"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_primary" {
  description = "CIDR for the public subnet - primary"
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr_secondary" {
  description = "CIDR for the public subnet - secondary"
  default = "10.0.2.0/24"
}

variable "public_subnet_cidr_tertiary" {
  description = "CIDR for the public subnet - tertiary"
  default = "10.0.3.0/24"
}

variable "private_subnet_cidr_primary" {
  description = "CIDR for the private subnet"
  default = "10.0.4.0/24"
}

variable "bootstrap_path" {
  description = "Script to install Host utils"
  default = "install-host.sh"
}

variable "aws_access_key" { 
  default = ""
}

variable "aws_secret_access_key" { 
  default = ""
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "keys/aws_"
}
