resource "random_string" "suffix" {
  length  = 8
  special = false
}

locals {
  region    = "ap-northeast-2"
  subdomain = "dev"

  name        = "mos"
  environment = terraform.workspace

  postfix                   = random_string.suffix.result
  vpc_name                  = "vpc-${local.name}-${local.environment}-${local.postfix}"
  eks_cluster_name          = "eks-${local.name}-${local.environment}-${local.postfix}"
  ip_range_prefix           = "172.31"
  cluster_service_ipv4_cidr = "10.20.0.0/16"
}
