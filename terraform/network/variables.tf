variable "common_tags" {
  type        = map(any)
  description = "Map with common tags. ENVIRONMENT, PRODUCT and OWNER are required."
  default = {
    ENVIRONMENT = "DEMO"
    PRODUCT     = "EKS"
    OWNER       = "ME"
  }
}


variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  type        = list(string)
  description = "List with id of public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "data_subnets" {
  type        = list(string)
  description = "List with id of data subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "eks_subnets" {
  type        = list(string)
  description = "List with id of eks subnets"
  default     = ["10.0.16.0/20", "10.0.32.0/20"]
}

variable "aws_region" {
  type        = string
  description = "AWS Region('us-east-1', 'us-east-2', etc)"
  default     = "us-east-1"
}

variable "azs" {
  type        = list(string)
  description = "The list of AZs for the subnets."
  default     = ["us-east-1a", "us-east-1c"]
}