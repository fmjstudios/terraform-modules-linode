variable "image" {
  type        = string
  description = "The image to use for the new Linode."
}

variable "type" {
  type        = string
  description = "The type of hardware to use for the new Linode."
}

variable "region" {
  type        = string
  description = "The datacenter region for the new Linode."
}

variable "cloud_config" {
  type        = any
  description = "Values for rendering of a Cloud-init template file."
  default     = {}
}

variable "vlan_config" {
  type        = any
  description = "The configuration values for the creation of a VLAN"
  default     = {}
}
