# Security group module

## Description

This module creates the security group

## Use

The variables "ingress\_rules" or "egress\_rules in the following format:

```terraform
variable "rules" {
  type        = map
  description = "Rules to security group"
  default = {
    rule01 = {
      description = "PayGo HTTPS"
      from_port   = "80"
      to_port     = "80"
      protocol    = "tcp"
      cidr_blocks = "177.92.66.200/29,201.16.171.160/29"
    }
    rule02 = {
      description = "Anywhere-Integration WebServices"
      from_port   = "8280"
      to_port     = "8280"
      protocol    = "tcp"
      security_groups = "sg-123456789,sg-987654321"
    }
    rule03 = {
      description = "Anywhere-Integration Registration WebServices"
      from_port   = "8380"
      to_port     = "8380"
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
    rule04 = {
      description = "itself-Integration Registration WebServices"
      from_port   = "8380"
      to_port     = "8380"
      protocol    = "tcp"
      self        = true
    }
  }
}
```

Each item must contain the following data 

* **rule[0-9][0-9]**: (Required) Rule name/index.
* **description**: (Required) Descripion for rule
* **from_port**: (Required) Starting port
* **to_port**: (Required) Final port
* **protocol**: (Required) Protocol (icmp, tcp, udp, all or use the protocol number)
* **cidr_blocks**: (Opcional) CIDR blocks list (comma separated)
* **security_groups**: (Opcional) Security groups list (comma separated)
* **self**: If true, the security group itself will be added as a source

Required cids_block or security_groups or self

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
| common\_tags | Map with common tags. WORKSPACE, ENVIRONMENT, PRODUCT and OWNER are required. | `map` | n/a | yes |
| custom\_sg\_name | If true, the name of security group is exact sg\_name varaible. If false, the name use default pattern | `bool` | `false` | no |
| description | The security group description. | `string` | n/a | yes |
| egress\_rules | egress rules list to security group | `map` | <pre>{<br>  "any_all": {<br>    "cidr_blocks": "0.0.0.0/0",<br>    "description": "Everywere",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "to_port": 0<br>  }<br>}</pre> | no |
| ingress\_rules | ingress rules to security group | `map` | n/a | yes |
| sg\_name | The name of the security group. | `string` | n/a | yes |
| vpc\_id | The VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| security\_group | The security group object with all attributes |
| sg\_id | The ID of the security group |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->