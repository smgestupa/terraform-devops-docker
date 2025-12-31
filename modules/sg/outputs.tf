output "this" {
  description = "The Security Group resource"
  value       = aws_security_group.this
}

output "ingress_rules" {
  description = "List of ingress rules of the Security Group"
  value       = aws_vpc_security_group_ingress_rule.this
}

output "egress_rules" {
  description = "List of egress rules of the Security Group"
  value       = aws_vpc_security_group_egress_rule.this
}