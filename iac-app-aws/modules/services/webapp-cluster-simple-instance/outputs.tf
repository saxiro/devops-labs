# outputs.tf

output "webapp_instance_public_ip" {
  value = "${aws_instance.webserver.public_ip}"
}

output "webapp_instance_public_dns" {
  value = "${aws_instance.webserver.public_dns}"
}
