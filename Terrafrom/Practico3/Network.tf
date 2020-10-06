resource "aws_vpc" "practico3-vpc" {
  cidr_block           = var.CIDR
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "VPC_ej_Terraform"

  }
}

resource "aws_subnet" "practico3-private-subnet" {
  vpc_id                  = aws_vpc.practico3-vpc.id
  cidr_block              = var.subnet
  map_public_ip_on_launch = "true"
  tags = {
    Name = "practico3-subnet-terraform"
  }
}

resource "aws_internet_gateway" "practico3-gateway" {
  vpc_id = aws_vpc.practico3-vpc.id
  tags = {
    Name = "practico3-gateway"
  }
}

resource "aws_default_route_table" "practico3-route" {
  default_route_table_id = aws_vpc.practico3-vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.practico3-gateway.id
  }
  tags = {
    Name = "practico3-default-route"
  }
}