data "template_file" "host_base_config" {
  template = "${file("amz2lnx-host-base-config.sh")}"

  vars {
    aws_access_key = "${var.aws_access_key}"
    aws_secret_access_key = "${var.aws_secret_access_key}"
    aws_region = "${var.aws_region}"
  }
}