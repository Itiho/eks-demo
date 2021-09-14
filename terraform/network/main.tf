locals {
  eks_tags = {
    "kubernetes.io/cluster/eks-demo"  = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
  public_tags = {
    "kubernetes.io/cluster/eks-demo" = "shared"
    "kubernetes.io/role/elb"         = "1"
  }
}

module "vpc" {
  source               = "../modules/vpc"
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  common_tags          = var.common_tags
}

module "public_subnets" {
  source                  = "../modules/subnet"
  vpc_id                  = module.vpc.vpc.id
  subnets                 = var.public_subnets
  azs                     = var.azs
  map_public_ip_on_launch = true
  tier                    = "PUBLIC"
  common_tags             = merge(local.public_tags, var.common_tags)
}

module "data_subnets" {
  source      = "../modules/subnet"
  vpc_id      = module.vpc.vpc.id
  subnets     = var.data_subnets
  azs         = var.azs
  tier        = "DATA"
  common_tags = var.common_tags
}

module "eks_subnets" {
  source      = "../modules/subnet"
  vpc_id      = module.vpc.vpc.id
  subnets     = var.eks_subnets
  azs         = var.azs
  tier        = "EKS"
  common_tags = merge(local.eks_tags, var.common_tags)
}

module "igw" {
  source      = "../modules/igw"
  vpc_id      = module.vpc.vpc.id
  common_tags = var.common_tags
}

module "eip_ng" {
  source      = "../modules/eip"
  vpc         = true
  common_tags = var.common_tags
}

module "nat_gateways" {
  source      = "../modules/natgw"
  subnet_id   = module.public_subnets.subnets.*.id
  eip_id      = module.eip_ng.eip_id
  common_tags = var.common_tags
}

module "public_route_table" {
  source        = "../modules/route-table"
  vpc_id        = module.vpc.vpc_id
  default_route = tomap({ "cidr_block" = "0.0.0.0/0", "gateway_id" = module.igw.igw_id })
  subnets       = module.public_subnets.subnets.*.id
  tier          = "PUBLIC"
  common_tags   = var.common_tags
}

module "data_route_table" {
  source        = "../modules/route-table"
  vpc_id        = module.vpc.vpc_id
  default_route = tomap({ "cidr_block" = "0.0.0.0/0", "nat_gateway_id" = module.nat_gateways.nat_gateway_id })
  subnets       = module.data_subnets.subnets.*.id
  tier          = "DATA"
  common_tags   = var.common_tags
}

module "eks_route_table" {
  source        = "../modules/route-table"
  vpc_id        = module.vpc.vpc_id
  default_route = tomap({ "cidr_block" = "0.0.0.0/0", "nat_gateway_id" = module.nat_gateways.nat_gateway_id })
  subnets       = module.eks_subnets.subnets.*.id
  tier          = "EKS"
  common_tags   = var.common_tags
}
