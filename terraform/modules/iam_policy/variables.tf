variable "policy_name" {
  type        = string
  description = " The name of the role. If omitted, Terraform will assign a random, unique name."
  default     = null
}

variable "policy_path" {
  type        = string
  description = "This variable is used to organize Iam policys in a group"
}

variable "policy" {
  type        = string
  description = "Policy json"
  default     = null
}