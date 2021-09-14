locals {
  local_tags = {
    Name      = "NAT-GW-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}"
    VPC       = "VPC-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}"
    TERRAFORM = "TRUE"
    ROLE      = "NETWORK"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = var.eip_id
  subnet_id     = element(var.subnet_id, 0)
  tags          = merge(var.common_tags, local.local_tags)
}

