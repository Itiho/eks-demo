output "sg_id" {
  description = "The ID of the security group"
  value       = aws_security_group.sg.id
}

output "security_group" {
  description = "The security group object with all attributes"
  value       = aws_security_group.sg
}

