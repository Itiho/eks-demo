terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.58"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.4"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "~>2.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "~>3.1"
    }
  }
}
