resource "aws_autoscaling_group" "asg_app_prod" {
  name = "asg-app-prod"
  desired_capacity = 1
  max_size = 1
  min_size = 1
  vpc_zone_identifier = ["${aws_subnet.public_subnet_primary.id}"]
  termination_policies = ["OldestInstance"]
  
  launch_template = {
    id = "${aws_launch_template.app_prod_launch_template.id}"
    version = "$$Latest"
  }

  tag {
    key                 = "App"
    value               = "App"
    propagate_at_launch = true
  }

  tag {
    key                 = "App Env"
    value               = "Prod"
    propagate_at_launch = true
  }
}