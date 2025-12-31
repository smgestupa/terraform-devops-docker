output "this" {
  description = "The IAM role resource"
  value       = aws_iam_role.this
}

output "policy_document" {
  description = "The role's policy document"
  value       = data.aws_iam_policy_document.this
}

output "instance_profile" {
  description = "The role's instance profile"
  value       = try(aws_iam_instance_profile.this[0], null) == null ? null : aws_iam_instance_profile.this[0]
}