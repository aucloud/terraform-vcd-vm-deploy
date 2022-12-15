/*
   Copyright 2022 Sovereign Cloud Australia Pty. Ltd

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

*/

/*
    Terraform files when run are concantenated.
    The files are broken down in a best practice way.
*/

// This is required as there is a race condition in destroy which does not appaer to be resolvable.
// Appears to be due to VMs not cleaning out NIC connections in time.
resource "time_sleep" "destroy_minute" {
  depends_on = [
    vcd_network_routed_v2.Network
  ]

  destroy_duration = "60s"
}

resource "vcd_vapp_vm" "demo_vm" {
  depends_on = [
    time_sleep.destroy_minute

  ]
  name          = var.vm_name
  vapp_name     = vcd_vapp.network_app.name
  catalog_name  = var.catalog_name
  template_name = var.template_name

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
    "hostname" = var.demo_hostname
    "meta-data" = base64encode(templatefile("cloudinit/metadata.tmpl", {
    }))
    "user-data" = base64encode(templatefile("cloudinit/userdata.tmpl", {
      "hostname" = var.demo_hostname
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