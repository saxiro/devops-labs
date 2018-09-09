variable "aws_region" {
  description = "AWS region on which we will setup the swarm cluster"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default = "10.0.2.0/24"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "~/.ssh/aws.pem"
}
