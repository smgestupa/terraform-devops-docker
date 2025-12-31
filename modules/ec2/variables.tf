variable "name" {
  type        = string
  nullable    = false
}

variable "ami" {
  description = "ID of the AMI as the guest operating system"
  type        = string
  nullable    = false
}

variable "instance_type" {
  description = "Type of compute to use"
  type        = string
  default     = "t4g.nano"
  nullable    = false
}

variable "key_name" {
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of Security Group IDs to attach"
  type        = list(string)
  default     = null
}

variable "subnet_id" {
  description = "ID of the subnet to deploy in"
  type        = string
  default     = null
}

variable "associate_public_ip_address" {
  description = "Toggle whether or not to provide a public IPv4 address"
  type        = bool
  nullable    = false
}

variable "monitoring" {
  type        = bool
  nullable    = false
}

variable "user_data" {
  description = "User data to run scripts during the startup"
  type        = string
  default     = null
}

variable "iam_instance_profile" {
  description = "Name of the instance's IAM profile"
  type        = string
  default     = null
}

variable "create_root_block_device" {
  description = "Collection of the configuration to create the block device mapping"
  type        = object({
    encrypted = optional(bool)
  })
  default     = null
}