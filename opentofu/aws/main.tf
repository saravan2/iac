provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "security_group" {
  name        = "Custom Security Group"
  description = "Custom Security Group that allows https, http and ssh"

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_instance" "app_server" {
  ami             = data.aws_ssm_parameter.ami.value
  instance_type   = "t2.micro"
  key_name        = "linux"
  security_groups = [aws_security_group.security_group.name]
  tags = {
    Name = var.instance_name
  }
}

data "aws_ssm_parameter" "ami" {
  name = var.aws_ssm_parameter_ami_name
}