output "this" {
  description = "List of Subnets"
  value       = aws_subnet.this
}

output "route_table" {
  description = "The Route Table resource"
  value       = aws_route_table.this
}