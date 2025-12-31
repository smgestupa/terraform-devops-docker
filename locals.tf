locals {
  create_ingress_rules = [
    for rule in merge(var.var.sg_app_create_ingress_rules, {
      cidr_ipv4   = var.my_ip
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
    })
    : rule
  ]
}