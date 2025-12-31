variable "name" {
  type     = string
  nullable = false
}

variable "cidr" {
  type     = string
  nullable = false
}

variable "enable_dns_hostnames" {
  type     = bool
  nullable = false
}

variable "enable_dns_support" {
  type     = bool
  nullable = false
}

variable "create_internet_gateway" {
  type    = object({
    name   = optional(string)
    domain = optional(string)
  })
  default = null
}