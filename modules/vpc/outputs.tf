output "this" {
  description = "The VPC resource"
  value       = aws_vpc.this
}

output "internet_gateway" {
  description = "The Internet Gateway resource"
  value       = try(aws_internet_gateway.this[0], null) == null ? null : aws_internet_gateway.this[0]
}