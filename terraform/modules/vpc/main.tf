locals {
  local_tags = {
    Name      = "VPC-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}"
    VPC       = "VPC-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}"
    TERRAFORM = "TRUE"
    ROLE      = "NETWORK"
  }
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = merge(var.common_tags, local.local_tags)
}
