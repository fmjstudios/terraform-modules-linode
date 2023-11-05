variable "label" {
  type        = string
  description = "The unique label to use for the new Linode Object Storage bucket."
}

variable "cluster" {
  type        = string
  description = "The cluster region to use for the new Linode Object Storage bucket. Defaults to 'eu-central'."
  default     = "eu-central"
}

variable "acl" {
  type        = string
  description = "The Access Control Level to use for the new Linode Object Storage bucket. Defaults to private."
  default     = "public-read"
}

variable "versioning" {
  type        = bool
  description = "Whether or not to enable versioning for the new Linode Object Storage bucket."
  default     = null
}

# #####
variable "lifecycle_rules" {
  type        = any
  description = "A list of lifecycle rules to apply to the new Linode Object Storage bucket."
  default     = {}
}

variable "cors" {
  type        = any
  description = "A map of settings and configuration for use with the Linode Object Storage bucket."
  default     = {}
}

variable "key_config" {
  type        = any
  description = "The access/secret key configuration"
  default     = {}
}

variable "key_permissions" {
  type        = string
  description = "The permissions to attach to the newly created access key."
  default     = "read-write"
}
