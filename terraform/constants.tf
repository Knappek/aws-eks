locals {
  vpc_cidr = "172.17.0.0/16"
  vpc_private_subnet_cidrs = ["172.17.128.0/21", "172.17.136.0/21", "172.17.144.0/21"]
  vpc_public_subnet_cidrs = ["172.17.0.0/21", "172.17.8.0/21", "172.17.16.0/21"]

  cluster_name = "andy-virtual-kubelet"

  default_tags = {
    owner = "andreas.knapp"
  }
}
