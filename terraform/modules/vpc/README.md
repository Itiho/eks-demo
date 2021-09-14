# VPC module

## Description

This module creates the VPC.

## Use

The variable "common\_tags" in the following format:

```terraform
variable "common\_tags" {
  type        = map
  description = "Map with common tags"
  default = {
    ENVIRONMENT = var.environment
    PRODUCT     = var.product
    OWNER       = var.owner
  }
}
```

It is recommended to use Local Values to create this variable.

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
| [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cidr\_block | The CIDR block for the VPC. | `string` | n/a | yes |
| common\_tags | Map with common tags | `map(any)` | n/a | yes |
| enable\_dns\_hostnames | A boolean flag to enable/disable DNS hostnames in the VPC. | `string` | `true` | no |
| enable\_dns\_support | A boolean flag to enable/disable DNS support in the VPC. | `string` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc | The VPC object with all attributes |
| vpc\_cidr | The CIDR block of the VPC |
| vpc\_id | The ID of the VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->