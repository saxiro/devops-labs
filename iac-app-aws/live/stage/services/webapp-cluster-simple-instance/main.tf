# main.tf

provider "aws" {
  region = "us-east-1"
}

module "webapp_cluster_simple_instance" {
  source = "../../../modules/services/webapp-cluster-simple-instance"

  cluster_name = "webapp"
  instance_type = "t2.micro"
}
