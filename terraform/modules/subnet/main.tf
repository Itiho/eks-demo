locals {
  local_tags = {
    VPC       = "VPC-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}"
    TERRAFORM = "TRUE"
    ROLE      = "NETWORK"
    TIER      = var.tier
  }
}

resource "null_resource" "module_depends_on" {
  triggers = {
    value = length(var.depends)
  }
}

resource "aws_subnet" "subnets" {
  count                   = length(var.subnets)
  depends_on              = [null_resource.module_depends_on]
  vpc_id                  = var.vpc_id
  cidr_block              = element(concat(var.subnets, [""]), count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
    var.common_tags,
    local.local_tags,
    tomap(
      {
        "Name" = "SUBNET-${var.common_tags["PRODUCT"]}-${var.tier}-${element(var.azs, count.index)}",
        "ZONE" = element(var.azs, count.index)
      }
    )
  )
}
