/*
	Copyright (C) 2022 Sovereign Cloud Australia Pty. Ltd.
	All rights reserved.

    outputs.tf
    
    Use outputs to define values you need to be able get access to. 
    Examples could include:
        - Server names
        - IP addresses
    Examples do not include:
        - passwords

    Access via calling terraform init followed by terraform output (where you have access to the backend)
*/

output "demo_details" {
  value = {
    app = {
      description = "details of the vapp"
      id          = vcd_vapp.network_app.id
      name        = vcd_vapp.network_app.name
    }
    vm = {
      description = "details of the vm"
      id          = vcd_vapp_vm.demo_vm.name
      name        = vcd_vapp.network_app.name
      ip_address  = vcd_vapp_vm.demo_vm.network[0].ip
    }
  }
}

