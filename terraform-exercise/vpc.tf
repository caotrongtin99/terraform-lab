data "aws_availability_zones" "available" {}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)
}

################################################################################
# VPC Module
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

  name = "codestar-projects-vpc"
  cidr = "10.0.0.0/16"

  azs            = local.azs
  public_subnets = [for k, v in local.azs : cidrsubnet("10.0.0.0/16", 4, k)]
}
