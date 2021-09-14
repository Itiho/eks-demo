variable "vpc_id" {
  type        = string
  description = "The VPC ID."
}

variable "subnets" {
  type        = list(string)
  description = "List of subnets"
  default     = []
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
  default     = false
}

variable "common_tags" {
  type        = map(any)
  description = "Map with common tags"
}

variable "tier" {
  type        = string
  description = "The TIER name for subnet"
}

variable "azs" {
  type        = list(string)
  description = "The list of AZs for the subnets."
  default     = []
}

variable "depends" {
  type        = list(any)
  description = "explicitly specify a dependency"
  default     = []
}
