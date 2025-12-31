variable "name" {
  type     = string
  nullable = false
}

variable "vpc_id" {
  description = "ID of the VPC where the Security Group will be attached"
  type        = string
  nullable    = false
}

variable "create_ingress_rules" {
  type     = list(object({
    cidr_ipv4                    = optional(string)
    from_port                    = optional(string)
    to_port                      = optional(string)
    ip_protocol                  = optional(string)
    referenced_security_group_id = optional(string)
  }))
  nullable = false
}

variable "create_egress_rules" {
  type     = list(object({
    cidr_ipv4                    = optional(string)
    from_port                    = optional(string)
    to_port                      = optional(string)
    ip_protocol                  = optional(string)
    referenced_security_group_id = optional(string)
  }))
  nullable = false
}