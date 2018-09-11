provider "aws" {
  region = "${var.aws_region}"
}

provider "aws" {
  alias = "current"
  region = "${var.aws_region}"
}