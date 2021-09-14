locals {
  local_tags = {
    Name      = var.custom_sg_name ? var.sg_name : upper("SG-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}-${var.sg_name}")
    VPC       = "VPC-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}"
    TERRAFORM = "TRUE"
    ROLE      = "SECURITY"
  }
}

resource "aws_security_group" "sg" {
  name        = var.custom_sg_name ? var.sg_name : upper("SG-${var.common_tags["PRODUCT"]}-${var.common_tags["ENVIRONMENT"]}-${var.sg_name}")
  description = var.description
  vpc_id      = var.vpc_id
  tags        = merge(var.common_tags, local.local_tags)

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description     = "${egress.key}-${egress.value["description"]}"
      from_port       = egress.value["from_port"]
      to_port         = egress.value["to_port"]
      protocol        = egress.value["protocol"]
      cidr_blocks     = lookup(egress.value, "cidr_blocks", null) != null ? split(",", egress.value["cidr_blocks"]) : null
      security_groups = lookup(egress.value, "security_groups", null) != null ? split(",", egress.value["security_groups"]) : null
      prefix_list_ids = lookup(egress.value, "prefix_list_ids", null) != null ? split(",", egress.value["prefix_list_ids"]) : null
      self            = lookup(egress.value, "self", null)
    }
  }

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description     = "${ingress.key}-${ingress.value["description"]}"
      from_port       = ingress.value["from_port"]
      to_port         = ingress.value["to_port"]
      protocol        = ingress.value["protocol"]
      cidr_blocks     = lookup(ingress.value, "cidr_blocks", null) != null ? split(",", ingress.value["cidr_blocks"]) : null
      security_groups = lookup(ingress.value, "security_groups", null) != null ? split(",", ingress.value["security_groups"]) : null
      self            = lookup(ingress.value, "self", null)
    }
  }

}

