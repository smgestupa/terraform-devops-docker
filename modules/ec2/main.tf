resource "aws_instance" "this" {
  tags = merge(data.aws_default_tags.this.tags, {
    Name = var.name
  })

  instance_type               = var.instance_type
  ami                         = var.ami
  key_name                    = try(coalesce(trimspace(var.key_name), null), null)
  vpc_security_group_ids      = try(var.vpc_security_group_ids, null)
  subnet_id                   = try(coalesce(trimspace(var.subnet_id), null), null)
  associate_public_ip_address = var.associate_public_ip_address
  monitoring                  = var.monitoring
  user_data                   = try(coalesce(trimspace(var.user_data), null), null)
  iam_instance_profile        = try(coalesce(trimspace(var.iam_instance_profile), null), null)

  dynamic "root_block_device" {
    for_each = try(var.create_root_block_device, null) == null ? [] : toset([var.create_root_block_device])

    content {
      encrypted = try(root_block_device.value.encrypted, null)
    }
  }
}