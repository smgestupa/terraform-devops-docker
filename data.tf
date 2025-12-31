data "aws_caller_identity" "this" {}

data "aws_availability_zones" "this" {
  state = "available"
}

data "aws_ami" "this" {
  most_recent = true
  name_regex  = "^((al2023-ami-2023).+)"
  owners      = ["amazon"]

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["arm64"]
  }
}

data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}