resource "aws_key_pair" "default" {
  key_name = "aws"
  public_key = "${file("${var.key_path}")}"
}