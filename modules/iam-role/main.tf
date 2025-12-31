resource "aws_iam_role" "this" {
  name               = "${var.name}-role"
  assume_role_policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  count = var.policy_attachments == null ? 0 : length(var.policy_attachments)

  policy_arn = var.policy_attachments[count.index]
  role       = aws_iam_role.this.name
}

resource "aws_iam_instance_profile" "this" {
  count = var.create_instance_profile ? 1 : 0

  name = "${var.name}-instance-profile"
  role = aws_iam_role.this.name
}