output "route_table" {
  description = "List of IDs of all route tables"
  value       = aws_route_table.route_table
}

output "id" {
  description = "ID of created route table"
  value       = aws_route_table.route_table.id
}
