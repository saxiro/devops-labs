
# resource "aws_eip" "one" {
#   vpc                       = true
#   network_interface         = "${aws_network_interface.test.id}"
# }

output "instance_ips" {
  value = ["${aws_autoscaling_group.asg_app_prod.id}"]
}