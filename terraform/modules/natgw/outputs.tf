output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = aws_nat_gateway.nat_gateway.id
}

output "nat_gateway" {
  description = "The NAT Gateway object with all attributes"
  value       = aws_nat_gateway.nat_gateway
}
