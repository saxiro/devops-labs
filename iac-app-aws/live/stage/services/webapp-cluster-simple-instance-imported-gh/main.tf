
module "webapp_cluster_simple_instance" {
  source = "git@github.com:cristiancmello/tf-modules.git//modules/services/webapp-cluster-simple-instance?ref=v0.1.0"
  
  cluster_name = "webapp"
  instance_type = "t2.micro"
}
