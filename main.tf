/*
	Copyright (C) 2022 Sovereign Cloud Australia Pty. Ltd.
	All rights reserved.
*/

/*
    Terraform files when run are concantenated.
    The files are broken down in a best practice way.
*/

resource "vcd_vapp_vm" "demo_vm" {
  name          = "demo-vm"
  vapp_name     = vcd_vapp.network_app.name
  catalog_name  = "demo"
  template_name = "Ubuntu 20.04 Server (demo)"

  memory    = 4096
  cpus      = 2
  cpu_cores = 2

  override_template_disk {
    bus_type    = "paravirtual"
    size_in_mb  = "20480.0"
    bus_number  = 0
    unit_number = 0
    iops        = 2000
  }

  guest_properties = {
    "hostname" = "demovm"
    "meta-data" = base64encode(templatefile("cloudinit/metadata.tmpl", {
    }))
    "user-data" = base64encode(templatefile("cloudinit/userdata.tmpl", {
      "hostname" = "demovm"
    }))
  }

  network_dhcp_wait_seconds = 300
  network {
    name               = vcd_vapp_org_network.network_net.org_network_name
    type               = "org"
    adapter_type       = "VMXNET3"
    ip_allocation_mode = "DHCP"
    is_primary         = true
  }

  customization {
    enabled = true
  }
}