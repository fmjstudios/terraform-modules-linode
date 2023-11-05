# data "linode_object_storage_cluster" "cluster_config" {
#   id = var.cluster
# }
#
# This throws some weird error like: 'Error: Unable to get LKE Versions: %s'

locals {
  cluster_id = var.cluster

  cors_enabled = var.cors["enabled"]
  cors_rules   = var.cors["rules"]

  bucket_label = var.label

  key_label       = "s3_key-${var.label}"
  key_permissions = var.key_config["permissions"]

  access_key = var.key_config["access_key"]
  secret_key = var.key_config["secret_key"]
}


resource "linode_object_storage_key" "delta4x4_key" {
  label = local.key_label

  bucket_access {
    bucket_name = local.bucket_label
    cluster     = local.cluster_id
    permissions = local.key_permissions
  }
}

resource "linode_object_storage_bucket" "delta4x4_bucket" {
  cluster = var.cluster
  label   = local.bucket_label

  acl        = var.acl
  access_key = local.access_key
  secret_key = local.secret_key

  cors_enabled = local.cors_enabled
  versioning   = var.versioning
}


