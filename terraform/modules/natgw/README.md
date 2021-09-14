# Nat Gateway module

## Description

This module creates the Nat Gateway.

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
| [aws_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| common\_tags | Map with common tags. WORKSPACE, ENVIRONMENT, PRODUCT and OWNER are required. | `map(any)` | n/a | yes |
| eip\_id | The Allocation ID of the Elastic IP address for the gateway. | `string` | n/a | yes |
| subnet\_id | The Subnet ID of the subnet in which to place the gateway. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| nat\_gateway | The NAT Gateway object with all attributes |
| nat\_gateway\_id | The ID of the NAT Gateway. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->