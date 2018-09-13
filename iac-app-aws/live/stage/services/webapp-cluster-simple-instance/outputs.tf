# outputs.tf

output "webapp_instance_public_ip" {
  value = "${module.webapp_cluster_simple_instance.webapp_instance_public_ip}"
}

output "webapp_instance_public_dns" {
  value = "${module.webapp_cluster_simple_instance.webapp_instance_public_dns}"
}
