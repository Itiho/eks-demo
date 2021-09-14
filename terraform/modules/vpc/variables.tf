variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "enable_dns_support" {
  type        = string
  description = "A boolean flag to enable/disable DNS support in the VPC. "
  default     = true
}

variable "enable_dns_hostnames" {
  type        = string
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
  default     = true
}

variable "common_tags" {
  type        = map(any)
  description = "Map with common tags"
}