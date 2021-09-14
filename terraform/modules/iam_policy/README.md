# IAM policy module

## Description

This module provides an IAM policy.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| policy | Policy json | `string` | `null` | no |
| policy\_name | The name of the role. If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |
| policy\_path | This variable is used to organize Iam policys in a group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| policy | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
