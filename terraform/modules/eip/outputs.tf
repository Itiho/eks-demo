output "eip_id" {
  description = "Contains the EIP allocation ID."
  value       = var.use_eip ? aws_eip.eip[0].id : null
}

output "eip" {
  description = "the eip object with all attributes"
  value       = var.use_eip ? aws_eip.eip[0] : null
}

