variable "ingress_alb_rules" {
  type        = map(any)
  description = "Rules to Ingress ALB"
  default = {
    all_self_sg = {
      description = "All protocols from who has this SG"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      self        = true
    }
  }
}