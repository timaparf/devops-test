data "aws_availability_zones" "available" {}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.environment_name
  cidr = var.vpc_cidr

  azs                 = local.azs
  private_subnets     = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k)]
  public_subnets      = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 4)]
  database_subnets    = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 8)]
  elasticache_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 12)]
  intra_subnets       = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 16)]

  private_subnet_names = []
  # public_subnet_names omitted to show default name generation for all three subnets
  database_subnet_names    = []
  elasticache_subnet_names = []
  intra_subnet_names       = []

#   enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = local.tags
}
