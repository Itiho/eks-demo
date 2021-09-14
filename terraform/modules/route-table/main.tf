locals {
  local_tags = {
    Name      = "RT-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}-${var.tier}${var.name_sufix}"
    VPC       = "VPC-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}"
    TERRAFORM = "TRUE"
    ROLE      = "NETWORK"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id
  tags   = merge(var.common_tags, local.local_tags)

  dynamic "route" {
    for_each = concat([var.default_route], var.routes)
    content {
      cidr_block                = lookup(route.value, "cidr_block", "")
      ipv6_cidr_block           = lookup(route.value, "ipv6_cidr_block", "")
      egress_only_gateway_id    = lookup(route.value, "egress_only_gateway_id", "")
      gateway_id                = lookup(route.value, "gateway_id", "")
      instance_id               = lookup(route.value, "instance_id", "")
      nat_gateway_id            = lookup(route.value, "nat_gateway_id", "")
      network_interface_id      = lookup(route.value, "network_interface_id", "")
      transit_gateway_id        = lookup(route.value, "transit_gateway_id", "")
      vpc_peering_connection_id = lookup(route.value, "vpc_peering_connection_id", "")
      local_gateway_id          = lookup(route.value, "local_gateway_id", "")
      vpc_endpoint_id           = lookup(route.value, "vpc_endpoint_id", "")
    }
  }

}

resource "aws_route_table_association" "rt_assossiation_subnets" {
  count          = length(var.subnets)
  subnet_id      = element(var.subnets, count.index)
  route_table_id = aws_route_table.route_table.id
}
