resource "aws_security_group" "app_prod_sg" {
  name        = "app-prod-sg"
  description = "app-prod-sg Security Group"
  vpc_id      = "${aws_vpc.default.id}"

  # Allow all inbound
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}