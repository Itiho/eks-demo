# Network

## Description

This code deploy the network resources for this demo

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | ~> 3.58.0 |

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| data_route_table | ../modules/route-table |  |
| data_subnets | ../modules/subnet |  |
| eip_ng | ../modules/eip |  |
| eks_route_table | ../modules/route-table |  |
| eks_subnets | ../modules/subnet |  |
| igw | ../modules/igw |  |
| nat_gateways | ../modules/natgw |  |
| public_route_table | ../modules/route-table |  |
| public_subnets | ../modules/subnet |  |
| vpc | ../modules/vpc |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | AWS Region('us-east-1', 'us-east-2', etc) | `string` | `"us-east-1"` | no |
| azs | The list of AZs for the subnets. | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1c"<br>]</pre> | no |
| common\_tags | Map with common tags. ENVIRONMENT, PRODUCT and OWNER are required. | `map(any)` | <pre>{<br>  "ENVIRONMENT": "DEMO",<br>  "OWNER": "ME",<br>  "PRODUCT": "EKS"<br>}</pre> | no |
| data\_subnets | List with id of data subnets | `list(string)` | <pre>[<br>  "10.0.3.0/24",<br>  "10.0.4.0/24"<br>]</pre> | no |
| eks\_subnets | List with id of eks subnets | `list(string)` | <pre>[<br>  "10.0.16.0/20",<br>  "10.0.32.0/20"<br>]</pre> | no |
| public\_subnets | List with id of public subnets | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24"<br>]</pre> | no |
| vpc\_cidr\_block | The CIDR block for the VPC. | `string` | `"10.0.0.0/16"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->