provider "aws" {
  region = "us-west-2"
}

data "aws_availability_zones" "current" {}

module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  name                 = "eks-fargate-vpc"
  cidr                 = "${local.vpc_cidr}"

  azs                  = ["${data.aws_availability_zones.current.names}"]
  private_subnets      = ["${local.vpc_private_subnet_cidrs}"]
  public_subnets       = ["${local.vpc_public_subnet_cidrs}"]

  enable_nat_gateway   = true
  single_nat_gateway   = true

  tags                 = "${merge(local.default_tags, map("kubernetes.io/cluster/${local.cluster_name}", "shared"))}"
}
