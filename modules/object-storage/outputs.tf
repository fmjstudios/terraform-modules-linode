output "access_key" {
  value       = linode_object_storage_bucket.delta4x4_bucket.access_key
  description = "The Access Key for the newly created Linode Object Storage Bucket."
  sensitive   = true
}

output "secret_key" {
  value       = linode_object_storage_bucket.delta4x4_bucket.secret_key
  description = "The Secret Key for the newly created Linode Object Storage Bucket."
  sensitive   = true
}

output "limited_access" {
  value       = linode_object_storage_key.delta4x4_key.limited
  description = "Whether or not the Access Key for the newly created Linode Object Storage Bucket is limited in its' capabilties."
}
