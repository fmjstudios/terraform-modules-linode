locals {
  ssh_allowed_users  = join(" ", var.cloud_config["ssh"].allow_users)
  ssh_allowed_groups = join(" ", var.cloud_config["ssh"].allow_groups)

  vlan_label        = var.vlan_config["label"]
  vlan_ipam_address = var.vlan_config["address"]
}

data "template_file" "cloud_config" {
  template = file("${path.module}/templates/cloud-config.tftpl")

  vars = {
    users                 = yamlencode(var.cloud_config["users"])
    enable_ssh_pwauth     = var.cloud_config["enable_ssh_pwauth"]
    pwauth_expire_passwds = var.cloud_config["pwauth_expire_passwds"]
    chpasswd_users        = indent(4, yamlencode(var.cloud_config["chpasswd_users"]))

    timezone = var.cloud_config["timezone"]
    locale   = var.cloud_config["locale"]

    preserve_hostname         = var.cloud_config["preserve_hostname"]
    hostname                  = var.cloud_config["hostname"]
    fqdn                      = var.cloud_config["fqdn"]
    prefer_fqdn_over_hostname = var.cloud_config["prefer_fqdn_over_hostname"]
    manage_etc_hosts          = var.cloud_config["manage_etc_hosts"]

    ssh_port           = var.cloud_config["ssh"].port
    ssh_listen_address = var.cloud_config["ssh"].listen_address
    ssh_log_level      = var.cloud_config["ssh"].log_level
    ssh_allow_users    = local.ssh_allowed_users
    ssh_allow_groups   = local.ssh_allowed_groups
  }
}

data "template_cloudinit_config" "cloud_config" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.cloud_config.rendered
  }
}

resource "linode_stackscript" "cloud-init" {
  script = chomp(file("${path.module}/scripts/stackscript.sh"))

  description = <<EOF
This StackScript takes a base64 encoded `userdata` variable which will be provided to `cloud-init` on boot.
  EOF

  rev_note = "initial cloud-init script"

  images = [
    "linode/ubuntu16.04lts",
    "linode/ubuntu18.04",
    "linode/ubuntu20.04",
    "linode/ubuntu22.04",
    "linode/ubuntu22.10",
    "linode/ubuntu23.04",
    "linode/debian8",
    "linode/debian9"
  ]

  is_public = false
  label     = "Cloud-Init"
}

resource "linode_instance" "delta4x4_instance" {
  image  = var.image
  type   = var.type
  region = var.region

  stackscript_id = linode_stackscript.cloud-init.id
  stackscript_data = {
    "userdata" = data.template_cloudinit_config.cloud_config.rendered
  }

  interface {
    purpose      = "vlan"
    label        = local.vlan_label
    ipam_address = local.vlan_ipam_address
  }
}
