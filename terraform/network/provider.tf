provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "itiho-s3-bucket"
    region  = "sa-east-1"
    key     = "vpc-eks.tfstate"
  }
}

