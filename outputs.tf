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

