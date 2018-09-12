resource "aws_autoscaling_group" "asg_app_prod" {
  name = "asg-app-prod"
  desired_capacity = 0
  max_size = 0
  min_size = 0
  #availability_zones = ["us-east-1a"] # descomentar em caso de criação de net interface
  vpc_zone_identifier = ["${aws_subnet.public_subnet_primary.id}"] # comentar em caso de criação de net interface
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