data "aws_kms_alias" "s3kmskey" {
  name = "alias/aws/s3"
}

resource "aws_codepipeline" "app" {
  name     = "AppPipeline"
  role_arn = "${aws_iam_role.CodePipeline_test.arn}"

  artifact_store {
    location = "${aws_s3_bucket.app_codepipeline_bucket.bucket}"
    type     = "S3"
    encryption_key {
      id   = "${data.aws_kms_alias.s3kmskey.arn}"
      type = "KMS"
    }
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["src-artifact-app"]

      configuration {
        Owner      = "cristiancmello"
        Repo       = "hello-app"
        Branch     = "master"
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "App - Prod"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeploy"
      input_artifacts = ["src-artifact-app"]
      version         = "1"

      configuration {
        ApplicationName = "${aws_codedeploy_app.app.name}"
        DeploymentGroupName = "${aws_codedeploy_deployment_group.app_prod.deployment_group_name}"
      }
    }
  }
}