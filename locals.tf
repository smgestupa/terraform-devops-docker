locals {
  sg_app_create_ingress_rules = [
      merge(var.sg_app_create_ingress_rules[0], {
      cidr_ipv4   = var.my_ip
    }),
    var.sg_app_create_ingress_rules[1]
  ]
}