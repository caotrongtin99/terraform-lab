terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  # profile = "default"
}


resource "aws_instance" "myapp" {
  count = length(var.myapp_instances)

  ami           = local.ami
  instance_type = local.instance_type

  tags = {
    Name = local.name
  }
}

resource "aws_instance" "myapp_instances" {
  for_each = var.myapp_instances

  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "${local.name}-${each.key}"
  }
}


resource "aws_security_group" "myapp-http" {
  name        = "myapp-http"
  description = "Allow HTTP traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


