variable "name" {
  type     = string
  nullable = false
}

variable "assume_policy_document" {
  type     = list(object({
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

variable "policy_attachments" {
  description = "List of policies to attach"
  type        = list(string)
  default     = null
}

variable "create_instance_profile" {
  type     = bool
  nullable = false
}