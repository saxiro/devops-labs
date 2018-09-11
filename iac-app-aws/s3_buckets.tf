resource "random_uuid" "main" { }

resource "aws_s3_bucket" "app_codepipeline_bucket" {
  bucket = "${random_uuid.main.result}-s3"
  acl    = "private"
  provider = "aws.current" # https://github.com/hashicorp/terraform/issues/4310#issuecomment-164480421
  force_destroy = true

  versioning {
    enabled = true
  }
  
  tags {
    Name        = "CodePipeline - App"
    Environment = "Dev"
  }
}