
module "ingress_alb_security" {
  source        = "../modules/security-group"
  sg_name       = "${local.cluster_name}-INGRESS-DEFAULT"
  description   = "Ingress ALB Security Group"
  vpc_id        = data.aws_vpc.vpc.id
  common_tags   = merge(local.common_tags, local.worker_sg_tags)
  ingress_rules = var.ingress_alb_rules
}