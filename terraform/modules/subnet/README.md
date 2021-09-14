# Subnets module

## Description

This module creates subnets.

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
| null | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) |
| [null_resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azs | The list of AZs for the subnets. | `list(string)` | `[]` | no |
| common\_tags | Map with common tags | `map(any)` | n/a | yes |
| depends | explicitly specify a dependency | `list(any)` | `[]` | no |
| map\_public\_ip\_on\_launch | Specify true to indicate that instances launched into the subnet should be assigned a public IP address | `bool` | `false` | no |
| subnets | List of subnets | `list(string)` | `[]` | no |
| tier | The TIER name for subnet | `string` | n/a | yes |
| vpc\_id | The VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnets | List of IDs of subnets |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->