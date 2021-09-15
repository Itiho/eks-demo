locals {
  common_tags = {
    ENVIRONMENT = "DEMO"
    PRODUCT     = "EKS"
    OWNER       = "ME"
  }
  cluster_name   = "eks-demo"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "EksAdmin_iam_assumable_role" {
  source            = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version           = "~> 4.4"
  tags              = local.common_tags
  create_role       = true
  role_requires_mfa = false
  role_name         = "EksAdmin"
  trusted_role_arns = [
    "arn:aws:iam::${data.aws_caller_identity.iam.account_id}:root"
  ]
}

module "EKSDev_iam_assumable_role" {
  source            = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version           = "~> 4.4"
  tags              = local.common_tags
  create_role       = true
  role_requires_mfa = false
  role_name         = "EKSDev"
  trusted_role_arns = [
    "arn:aws:iam::${data.aws_caller_identity.iam.account_id}:root"
  ]
}


module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "v17.18.0"
  map_roles = [
    {
      rolearn  = module.EksAdmin_iam_assumable_role.iam_role_arn
      username = "EksAdmin"
      groups   = ["system:masters"]
    },
    {
      rolearn  = module.EKSDev_iam_assumable_role.iam_role_arn
      username = "EKSDev"
      groups   = []
    }
  ]

  cluster_name                         = local.cluster_name
  cluster_version                      = var.cluster_version
  subnets                              = data.aws_subnet_ids.eks_subnet.ids
  vpc_id                               = data.aws_vpc.vpc.id
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  iam_path                    = "/eks-demo/"
  tags                        = local.common_tags
  worker_sg_ingress_from_port = 443
  workers_additional_policies = [module.nlb_ingress_controller_policy.policy.arn]
  worker_groups_launch_template = [
    {
      name                    = "spots"
      override_instance_types = ["t3.micro"]
      spot_instance_pools     = 2
      asg_max_size            = 1
      asg_min_size            = 1
      asg_desired_capacity    = 1
      kubelet_extra_args      = "--node-labels=node.kubernetes.io/lifecycle=spot,environment=demo,nodegroup=demo"
      public_ip               = false
      pre_userdata            = data.local_file.pre_userdata.content
      key_name                = "eks-demo" # Created in AWS Console
    }

  ]
}

#https://github.com/kubernetes-sigs/aws-alb-ingress-controller/blob/master/docs/examples/iam-policy.json
module "nlb_ingress_controller_policy" {
  source      = "../modules/iam_policy"
  policy_path = "/eks-demo/"
  policy      = file("${path.module}/policies/nlb_ingress_controller-policy.json")
}
