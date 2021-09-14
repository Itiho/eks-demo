output "igw_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.igw.id
}

output "igw" {
  description = "The internet gateway object with all attributes"
  value       = aws_internet_gateway.igw
}

