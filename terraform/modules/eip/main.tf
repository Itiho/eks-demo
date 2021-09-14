locals {
  local_tags = {
    Name      = "EIP-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}${var.sufix}"
    VPC       = "VPC-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}"
    TERRAFORM = "TRUE"
    ROLE      = "NETWORK"
    WORKSPACE = var.workspace
  }
}

resource "aws_eip" "eip" {
  count    = var.use_eip ? 1 : 0
  vpc      = var.vpc
  tags     = merge(var.common_tags, local.local_tags)
  instance = var.instance_id
  lifecycle {
    create_before_destroy = false
  }
}