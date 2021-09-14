provider "aws" {
  region = var.aws_region
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}


terraform {
  backend "s3" {
    encrypt = true
    bucket  = "itiho-s3-bucket"
    region  = "sa-east-1"
    key     = "eks.tfstate"
  }
}