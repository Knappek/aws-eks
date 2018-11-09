module "eks" {
  source                = "terraform-aws-modules/eks/aws"
  cluster_name          = "${local.cluster_name}"
  subnets               = "${module.vpc.private_subnets}"

  vpc_id                = "${module.vpc.vpc_id}"

  tags                  = "${local.default_tags}"
}