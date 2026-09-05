terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_network_address_usage_metrics = false
  tags = {
    Name        = "my_vpc"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name        = "subnet1"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name        = "gw"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

resource "aws_route_table" "default_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name        = "default_route_table"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

#resource "aws_route_table_association" "default_rta" {
#  subnet_id      = aws_subnet.subnet1.id
#  route_table_id = aws_route_table.default_route_table.id
#}

resource "aws_instance" "my_instance" {
  
  vpc_security_group_ids      = [aws_security_group.allow_tls.id, aws_security_group.allow_http.id, aws_security_group.allow_outbound.id]
  subnet_id                   = aws_subnet.subnet1.id
  associate_public_ip_address = true
  #ami                         = data.aws_ami.ubuntu.id
  ami                         = "ami-0123456789abcdef0"
  instance_type               = "t3.micro"
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd

              echo "<h1>Server Created with terraform</h1>" > /var/www/html/index.html
              EOF
  depends_on = [ aws_security_group.allow_tls, aws_security_group.allow_http, aws_security_group.allow_outbound ]
}

resource "aws_security_group" "allow_outbound" {
  name        = "allow_outbound"
  description = "Allow all outbound traffic"
  vpc_id      = aws_vpc.my_vpc.id
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.my_vpc.id
  ingress {
    description = "Allow TLS inbound traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["177.118.162.213/32"]
  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.my_vpc.id
  ingress {
    description = "Allow HTTP inbound traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}