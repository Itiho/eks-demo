variable "aws_region" {
  type        = string
  description = "AWS Region('sa-east-1', 'us-east-2', etc)"
  default     = "us-east-1"
}

variable "cluster_endpoint_public_access_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  default     = ["0.0.0.0/0"]
}

variable "cluster_version" {
  type        = string
  description = "Version of EKS service"
  default     = "1.19"
}