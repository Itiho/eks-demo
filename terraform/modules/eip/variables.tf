variable "vpc" {
  type        = bool
  description = "Boolean if the EIP is in a VPC or not."
  default     = true
}

variable "sufix" {
  type        = string
  description = "Sufix to add in EIP name"
  default     = ""
}

variable "common_tags" {
  type        = map(any)
  description = "Map with common tags. WORKSPACE, ENVIRONMENT, PRODUCT and OWNER are required."
}

variable "workspace" {
  type        = string
  description = "An ENVIRONMENT can have more than one workspace for other workload types. Eg Tests, Pilot, Integration, History / Task"
  default     = null
}

variable "instance_id" {
  type        = string
  description = "(Optional) EC2 instance ID."
  default     = null
}

variable "use_eip" {
  type        = bool
  description = "If true, create the elastic IP and associated with an instance"
  default     = true
}