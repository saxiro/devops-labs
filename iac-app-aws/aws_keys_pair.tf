resource "aws_key_pair" "default" {
  key_name = "aws_${var.aws_region}"
  public_key = "${file("${var.key_path}${var.aws_region}.pem")}"
}