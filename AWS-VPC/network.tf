resource "aws_vpc" "virtualprivatenetwork" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-curso-terraform"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.virtualprivatenetwork.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-curso-terraform"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.virtualprivatenetwork.id

  tags = {
    Name = "gw-curso-terraform"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.virtualprivatenetwork.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "route-table-curso-terraform"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_security_group" "security_group" {
  name        = "security-group-terraform"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.virtualprivatenetwork.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}