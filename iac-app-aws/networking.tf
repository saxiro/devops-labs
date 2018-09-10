data "aws_availability_zones" "available" {}

resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "app-vpc"
  }
}

resource "aws_subnet" "public_subnet_primary" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr_primary}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "Public Subnet - Primary"
  }
}

resource "aws_subnet" "public_subnet_secondary" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr_secondary}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags {
    Name = "Public Subnet - Secondary"
  }
}

resource "aws_subnet" "public_subnet_tertiary" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr_tertiary}"
  availability_zone = "${data.aws_availability_zones.available.names[2]}"

  tags {
    Name = "Public Subnet - Tertiary"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "VPC IGW"
  }
}

resource "aws_route_table" "web_public_rt_primary" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "Public Subnet RT - Primary"
  }
}

resource "aws_route_table" "web_public_rt_secondary" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "Public Subnet RT - Secondary"
  }
}

resource "aws_route_table" "web_public_rt_tertiary" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "Public Subnet RT - Tertiary"
  }
}


resource "aws_route_table_association" "web_public_rt_primary" {
  subnet_id = "${aws_subnet.public_subnet_primary.id}"
  route_table_id = "${aws_route_table.web_public_rt_primary.id}"
}

resource "aws_route_table_association" "web_public_rt_secondary" {
  subnet_id = "${aws_subnet.public_subnet_secondary.id}"
  route_table_id = "${aws_route_table.web_public_rt_secondary.id}"
}

resource "aws_route_table_association" "web_public_rt_tertiary" {
  subnet_id = "${aws_subnet.public_subnet_tertiary.id}"
  route_table_id = "${aws_route_table.web_public_rt_tertiary.id}"
}