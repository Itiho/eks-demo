# Elastic IP module

## Description

This module creates the Elastic IP.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| common\_tags | Map with common tags. WORKSPACE, ENVIRONMENT, PRODUCT and OWNER are required. | `map(any)` | n/a | yes |
| instance\_id | (Optional) EC2 instance ID. | `string` | `null` | no |
| sufix | Sufix to add in EIP name | `string` | `""` | no |
| use\_eip | If true, create the elastic IP and associated with an instance | `bool` | `true` | no |
| vpc | Boolean if the EIP is in a VPC or not. | `bool` | `true` | no |
| workspace | An ENVIRONMENT can have more than one workspace for other workload types. Eg Tests, Pilot, Integration, History / Task | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| eip | the eip object with all attributes |
| eip\_id | Contains the EIP allocation ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->