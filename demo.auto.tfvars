/*
	Copyright (C) 2022 Sovereign Cloud Australia Pty. Ltd.
	All rights reserved.
*/
#Please create the catalog and ensure template is available before attempting to build.
org                = "" # Please add the org value here.
vdc                = "" # Please add the vdc value here.
url                = "https://api-vcd-sz101.eportal.australiacloud.com.au/api"
edge_gateway       = "" # Please add the edge gateway value here.
network_public_ip  = "" # Please add an ip from the edge gateway ip allocation.
network_public_vip = "" # Please add an ip from the edge gateway ip allocation.
network_addr       = "" # Please provide an internal ip subnet here. 
vm_image           = "Ubuntu20-Mini"
vm_name            = "demo-vm"
catalog_name       = "demo"                       # Ensure catalog is available
template_name      = "Ubuntu 20.04 Server (demo)" # Ensure template is available.
demo_hostname      = "demovm"