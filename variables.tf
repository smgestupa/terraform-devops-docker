variable "my_ip" {
  description = "IP of the local machine"
  type        = string
  nullable    = false
}

variable "region" {
  description = "Region selected to deploy AWS infrastructure"
  type        = string
  nullable    = false
}

variable "tags" {
  description = "Additional metadata for resources"
  type        = map(string)
  nullable    = false
}


variable "vpc_name" {
  description = "Name to be used of the VPC"
  type        = string
  nullable    = false
}

variable "vpc_cidr" {
  description = "CIDR block to be used for the VPC"
  type        = string
  nullable    = false
}

variable "vpc_enable_dns_hostnames" {
  description = "Toggle whether or not to enable DNS hostnames for the VPC"
  type        = bool
  nullable    = false
}

variable "vpc_enable_dns_support" {
  description = "Toggle whether or not to enable DNS support for the VPC"
  type        = bool
  nullable    = false
}

variable "vpc_create_internet_gateway" {
  description = "Decide whether or not to create an Internet Gateway for the VPC"
  type = object({
    name   = optional(string)
    domain = optional(string)
  })
  default = null
}


variable "subnet_public_name" {
  description = "Name to be used for the public subnet"
  type        = string
  nullable    = false
}

variable "subnet_public_cidrs" {
  description = "Set of CIDR blocks to be used for the public subnet"
  type        = set(string)
  nullable    = false
}

variable "subnet_public_create_route_table" {
  description = "Decide whether or not to create a route table for the public subnet"
  type = object({
    name = optional(string)
    routes = optional(list(object({
      cidr_block     = optional(string)
      gateway_id     = optional(string)
      nat_gateway_id = optional(string)
    })))
  })
  nullable = false
}


variable "sg_app_name" {
  description = "Name to be used for the application's EC2 Security Group"
  type        = string
  nullable    = false
}

variable "sg_app_create_ingress_rules" {
  description = "List of ingress rules to be used for the application's EC2 Security Group"
  type = list(object({
    cidr_ipv4                    = optional(string)
    from_port                    = optional(string)
    to_port                      = optional(string)
    ip_protocol                  = optional(string)
    referenced_security_group_id = optional(string)
  }))
  nullable = false
}

variable "sg_app_create_egress_rules" {
  description = "List of egress rules to be used for the application's EC2 Security Group"
  type = list(object({
    cidr_ipv4                    = optional(string)
    from_port                    = optional(string)
    to_port                      = optional(string)
    ip_protocol                  = optional(string)
    referenced_security_group_id = optional(string)
  }))
  nullable = false
}


variable "role_app_name" {
  description = "Name to be used for the application's IAM role thru instance profile"
  type        = string
  nullable    = false
}

variable "role_app_assume_policy_document" {
  description = "Policy document to assume by the application's IAM role"
  type = list(object({
    sid     = optional(string)
    effect  = optional(string)
    actions = optional(list(string))

    principals = optional(list(object({
      type        = optional(string)
      identifiers = optional(list(string))
    })))
  }))
  nullable = false
}

variable "role_app_create_instance_profile" {
  description = "Decide whether or not to create an instance profile for the application's EC2 instance"
  type        = bool
  nullable    = false
}


variable "ec2_app_name" {
  description = "Name of the application's EC2 instance"
  type        = string
  nullable    = false
}

variable "ec2_app_key_name" {
  description = "Name of the keypair used to access the application's EC2 instance"
  type        = string
  default     = null
}

variable "ec2_app_update_default_version" {
  description = "Toggle whether or not to update the default version of the application's EC2 launch template"
  type        = bool
  nullable    = false
}

variable "ec2_app_associate_public_ip_address" {
  description = "Toggle whether or not to associate a public IP address to the application's EC2 instance"
  type        = bool
  nullable    = false
}

variable "ec2_app_monitoring" {
  description = "Toggle whether or not to enable detailed monitoring"
  type        = bool
  nullable    = false
}

variable "ec2_app_create_root_block_device" {
  description = "Configuration for creating the root block device of the application's EC2 instance"
  type = object({
    encrypted = optional(bool)
  })
  default = null
}