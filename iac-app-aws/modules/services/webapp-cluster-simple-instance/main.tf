# main.tf

data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20180810-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "webserver" {
  ami           = "${data.aws_ami.amzn2.id}"
  instance_type = "${var.instance_type}"

  tags {
    Name = "${var.cluster_name}"
  }
}