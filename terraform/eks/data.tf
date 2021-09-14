data "aws_vpc" "vpc" {
  tags = {
    VPC = "VPC-EKS-DEMO"
  }
}

data "aws_subnet_ids" "eks_subnet" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    TIER = "EKS"
  }
}

data "aws_caller_identity" "iam" {}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

data "local_file" "pre_userdata" {
  filename = "${path.module}/pre_userdata.sh"
}
