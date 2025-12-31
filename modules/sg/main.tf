resource "aws_security_group" "this" {
  tags = merge(data.aws_default_tags.this.tags, {
    Name = var.name
  })

  name   = var.name
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = { for index, values in var.create_ingress_rules : index => values }

  security_group_id            = aws_security_group.this.id
  cidr_ipv4                    = try(coalesce(trimspace(each.value.cidr_ipv4), null), null)
  from_port                    = try(coalesce(trimspace(each.value.from_port), null), null)
  to_port                      = try(coalesce(trimspace(each.value.to_port), null), null)
  ip_protocol                  = each.value.ip_protocol
  referenced_security_group_id = try(coalesce(trimspace(each.value.referenced_security_group_id), null), null)
}

resource "aws_vpc_security_group_egress_rule" "this" {
  for_each = { for index, values in var.create_egress_rules : index => values }

  security_group_id            = aws_security_group.this.id
  cidr_ipv4                    = try(coalesce(trimspace(each.value.cidr_ipv4), null), null)
  from_port                    = try(coalesce(trimspace(each.value.from_port), null), null)
  to_port                      = try(coalesce(trimspace(each.value.to_port), null), null)
  ip_protocol                  = each.value.ip_protocol
  referenced_security_group_id = try(coalesce(trimspace(each.value.referenced_security_group_id), null), null)
}