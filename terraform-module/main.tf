/*
provider "aws" {
  region = "ap-southeast-1"
}
*/

## count
/*
module "ec2_instances" {
  source        = "./modules/ec2"
  count         = 3
  ami           = "ami-01938df366ac2d954" # AMI Ubuntu 20.04 ở ap-southeast-1 (kiểm tra lại nhé)
  instance_type = "t2.micro"
  name          = "instance-${count.index}"
}
*/

## for_each
/*
module "ec2_instances" {
  source = "./modules/ec2"

  for_each = {
    web    = "ami-01938df366ac2d954"
    db     = "ami-01938df366ac2d954"
  }

  ami           = each.value
  instance_type = "t2.micro"
  name          = each.key
}
*/

## providers
provider "aws" {
  alias  = "singapore"
  region = "ap-southeast-1"
}

provider "aws" {
  alias  = "tokyo"
  region = "ap-northeast-1"
}

module "singapore_instance" {
  source = "./modules/ec2"
  providers = {
    aws = aws.singapore
  }
  ami           = "ami-01938df366ac2d954"
  instance_type = "t2.micro"
  name          = "singapore-instance"
}

module "tokyo_instance" {
  source = "./modules/ec2"
  providers = {
    aws = aws.tokyo
  }
  ami           = "ami-026c39f4021df9abe" # Ubuntu 20.04 Tokyo region
  instance_type = "t2.micro"
  name          = "tokyo-instance"
}

## depends_on
/*
module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  name = "my-vpc"
}

module "ec2" {
  source = "./modules/ec2"
  ami = "ami-01938df366ac2d954"
  instance_type = "t2.micro"
  name = "dependent-instance"

  depends_on = [module.vpc]
}
*/
