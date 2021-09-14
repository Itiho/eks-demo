variable "vpc_id" {
  type        = string
  description = "The VPC ID to create in."
}

variable "common_tags" {
  type        = map(any)
  description = "Map with common tags. WORKSPACE, ENVIRONMENT, PRODUCT and OWNER are required."
}