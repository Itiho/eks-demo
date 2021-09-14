resource "aws_iam_policy" "policy" {
  name   = var.policy_name
  path   = var.policy_path
  policy = var.policy
}