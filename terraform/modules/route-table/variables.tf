variable "subnets" {
  type        = list(string)
  description = "List with id of public subnets"
  default     = []
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

variable "routes" {
  type        = list(map(string))
  description = "Routes to add in Route Table "
  default     = []
}

variable "default_route" {
  type        = map(string)
  description = "Default routes to add in Route Table "
  default     = {}
}

variable "tier" {
  type        = string
  description = "The TIER name for subnet"
}

variable "common_tags" {
  type        = map(any)
  description = "Map with common tags. WORKSPACE, ENVIRONMENT, PRODUCT and OWNER are required."
}

variable "name_sufix" {
  description = "Sufix to add in route table name"
  type        = string
  default     = ""

}
