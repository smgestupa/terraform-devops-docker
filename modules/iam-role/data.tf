data "aws_iam_policy_document" "this" {
  dynamic "statement" {
    for_each = { for index, values in var.assume_policy_document : index => values }

    content {
      sid = try(coalesce(trimspace(statement.value.sid), null), null)

      dynamic "principals" {
        for_each = { for index, values in statement.value.principals : index => values }

        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      effect  = try(coalesce(trimspace(statement.value.effect), null), null)
      actions = try(statement.value.actions, null)
    }
  }
}