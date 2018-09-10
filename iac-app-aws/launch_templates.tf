data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20180810-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}
resource "aws_launch_template" "app_prod_launch_template" {
  name = "app-prod-launch-template_${var.aws_region}"
  image_id = "${data.aws_ami.amzn2.id}"
  instance_initiated_shutdown_behavior = "terminate"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.default.id}"
  #user_data = "${base64encode(file("${var.bootstrap_path}"))}"
  user_data = "${base64encode(data.template_file.host_base_config.rendered)}"

  iam_instance_profile {
    name = "${aws_iam_instance_profile.iam_instance_profile_app_prod.id}"
  }

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups = ["${aws_security_group.app_prod_sg.id}"]
    delete_on_termination = true
  }

  tag_specifications {
    resource_type = "instance"
    tags {
      Name = "app-prod"
    }
  }
}