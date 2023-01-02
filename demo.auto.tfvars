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
#Please create the catalog and ensure template is available before attempting to build.
org                = ""                                                        # Please add the org value here.
vdc                = ""                                                        # Please add the vdc value here.
url                = "https://api-vcd-sz101.eportal.australiacloud.com.au/api" # Set for PDCE SZ1
edge_gateway       = ""                                                        # Please add the edge gateway value here.
network_public_ip  = ""                                                        # Please add an ip from the edge gateway ip allocation.
network_public_vip = ""                                                        # Please add an ip from the edge gateway ip allocation.
# Provide the Network prefix for a /24 e.g for 10.0.0.0/24 provide 10.0.0
network_addr  = ""
vm_name       = "demo-vm"
catalog_name  = "demo"                       # Ensure catalog exists
template_name = "Ubuntu 20.04 Server (demo)" # Ensure template exists.
demo_hostname = "demovm"