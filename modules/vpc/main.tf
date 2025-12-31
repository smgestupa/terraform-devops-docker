resource "aws_vpc" "this" {
  tags = merge(data.aws_default_tags.this.tags, {
    Name = var.name
  })

  cidr_block           = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}

resource "aws_internet_gateway" "this" {
  count = var.create_internet_gateway == null ? 0 : 1

  tags = merge(data.aws_default_tags.this.tags, {
    Name = try(coalesce(trimspace(var.create_internet_gateway.name), null), null)
  })

  vpc_id = try(var.create_internet_gateway.vpc_id, null) == null ? aws_vpc.this.id : var.create_internet_gateway.vpc_id
}