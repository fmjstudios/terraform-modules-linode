output "ipv4" {
  value       = linode_instance.delta4x4_instance.ip_address
  description = "The public IPv4 address for the newly created Linode."
}

output "cpus" {
  value       = linode_instance.delta4x4_instance.specs.0.vcpus
  description = "The CPU configuration for the newly created Linode."
}

output "disk" {
  value       = linode_instance.delta4x4_instance.specs.0.disk
  description = "The disk configuration for the newly created Linode."
}

output "memory" {
  value       = linode_instance.delta4x4_instance.specs.0.memory
  description = "The memory configuration for the newly created Linode."
}

output "transfer" {
  value       = linode_instance.delta4x4_instance.specs.0.transfer
  description = "The amount of allotted network transfer for the newly created Linode."
}

output "status" {
  value       = linode_instance.delta4x4_instance.status
  description = "The status for the newly created Linode."
}
