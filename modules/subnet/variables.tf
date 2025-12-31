variable "name" {
  type     = string
  nullable = false
}

variable "vpc_id" {
  description = "ID of the VPC where the Security Group will be attached"
  type        = string
  nullable    = false
}

variable "cidrs" {
  type     = set(string)
  nullable = false
}

variable "availability_zones" {
  description = "List of availability zones to deploy in"
  type        = list(string)
  nullable    = false
}

variable "create_route_table" {
  type     = object({
    name = optional(string)
    routes = optional(list(object({
      cidr_block     = optional(string)
      gateway_id     = optional(string)
      nat_gateway_id = optional(string)
    })))
  })
  nullable = false
}