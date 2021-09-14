locals {
  local_tags = {
    Name      = "IGW-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}"
    VPC       = "VPC-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}"
    TERRAFORM = "TRUE"
    ROLE      = "NETWORK"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags   = merge(var.common_tags, local.local_tags)
}

