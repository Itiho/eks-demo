variable "vpc_id" {
  type        = string
  description = "The VPC ID."
}

variable "sg_name" {
  type        = string
  description = "The name of the security group."
}

variable "description" {
  type        = string
  description = " The security group description."
}

variable "common_tags" {
  type        = map
  description = "Map with common tags. WORKSPACE, ENVIRONMENT, PRODUCT and OWNER are required."
}

variable ingress_rules {
  type        = map
  description = "ingress rules to security group"
}

variable "custom_sg_name" {
  type        = bool
  description = "If true, the name of security group is exact sg_name varaible. If false, the name use default pattern"
  default     = false
}

variable egress_rules {
  type        = map
  description = "egress rules list to security group"
  default = {
    any_all = {
      description = "Everywere"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  }
}
