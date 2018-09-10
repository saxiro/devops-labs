resource "aws_codedeploy_app" "app" {
  name = "App"
  compute_platform = "Server" // Server => EC2/On-premises; Lambda => AWS Lambda functions
}

resource "aws_codedeploy_deployment_group" "example" {
  app_name              = "${aws_codedeploy_app.app.name}"
  deployment_group_name = "app-prod"
  service_role_arn      = "${aws_iam_role.CodeDeploy_test.arn}"
  autoscaling_groups = ["${aws_autoscaling_group.asg_app_prod.id}"]

  deployment_style {
    deployment_option = "WITHOUT_TRAFFIC_CONTROL"
    deployment_type   = "IN_PLACE"
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }
}