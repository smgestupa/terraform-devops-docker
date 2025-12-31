resource "aws_subnet" "this" {
  count = length(tolist(var.cidrs))

  tags = merge(data.aws_default_tags.this.tags, {
    Name = var.name
  })

  vpc_id            = var.vpc_id
  cidr_block        = tolist(var.cidrs)[count.index]
  availability_zone = element(var.availability_zones, count.index)
}

resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = merge(data.aws_default_tags.this.tags, {
    Name = try(coalesce(trimspace(var.create_route_table.name), null), null)
  })

  dynamic "route" {
    for_each = try(var.create_route_table.routes, null) == null ? [] : var.create_route_table.routes

    content {
      cidr_block     = try(coalesce(trimspace(route.value.cidr_block), null), null)
      gateway_id     = try(coalesce(trimspace(route.value.gateway_id), null), null)
      nat_gateway_id = try(coalesce(trimspace(route.value.nat_gateway_id), null), null)
    }
  }
}

resource "aws_route_table_association" "this" {
  count = length(tolist(var.cidrs))

  route_table_id = aws_route_table.this.id
  subnet_id      = aws_subnet.this[count.index].id
}