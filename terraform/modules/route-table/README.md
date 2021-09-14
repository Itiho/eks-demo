# Route Tables module

## Description

This module creates the data, app and public route tables.

## Use

The "default_route" and "routes" variables use this format:

```terraform
  default_route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.igw.igw_id
  }
```

* One of the following CIDR block must be supplied:
  * **cidr_block**: (Required) The IPv4 CIDR block of the route.
  * **ipv6_cidr_block**: (Required) The IPv6 CIDR block of the route.
* One of the following target arguments must be supplied:
  * **egress_only_gateway_id**: (Optional) Identifier of a VPC Egress Only Internet Gateway.
  * **gateway_id**: (Optional) Identifier of a VPC internet gateway or a virtual private gateway.
  * **instance_id**: (Optional) Identifier of an EC2 instance.
  * **nat_gateway_id**: (Optional) Identifier of a VPC NAT gateway.
  * **network_interface_id**: (Optional) Identifier of an EC2 network interface.
  * **transit_gateway_id**: (Optional) Identifier of an EC2 Transit Gateway.
  * **vpc_peering_connection_id**: (Optional) Identifier of a VPC peering connection.
  * **local_gateway_id**: (Optional) Identifier of a Outpost local gateway.
  * **vpc_endpoint_id**: (Optional) Identifier of a VPC Endpoint.

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
| [aws_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) |
| [aws_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| common\_tags | Map with common tags. WORKSPACE, ENVIRONMENT, PRODUCT and OWNER are required. | `map(any)` | n/a | yes |
| default\_route | Default routes to add in Route Table | `map(string)` | `{}` | no |
| name\_sufix | Sufix to add in route table name | `string` | `""` | no |
| routes | Routes to add in Route Table | `list(map(string))` | `[]` | no |
| subnets | List with id of public subnets | `list(string)` | `[]` | no |
| tier | The TIER name for subnet | `string` | n/a | yes |
| vpc\_id | The VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | ID of created route table |
| route\_table | List of IDs of all route tables |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
