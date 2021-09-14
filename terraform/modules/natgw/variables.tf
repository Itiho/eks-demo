variable "eip_id" {
  type        = string
  description = "The Allocation ID of the Elastic IP address for the gateway."
}

variable "subnet_id" {
  description = "The Subnet ID of the subnet in which to place the gateway."
}

variable "common_tags" {
  type        = map(any)
  description = "Map with common tags. WORKSPACE, ENVIRONMENT, PRODUCT and OWNER are required."
}