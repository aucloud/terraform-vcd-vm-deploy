/*
	Copyright (C) 2022 Sovereign Cloud Australia Pty. Ltd.
	All rights reserved.
*/
#Please create the catalog and ensure template is available before attempting to build.
org = "aucloud-demo"
vdc = "terraform-demo"
url = "https://api-vcd-sz101.eportal.australiacloud.com.au/api"
edge_gateway = "terraform-demo ESGW"
network_public_ip = "103.74.201.22"
network_public_vip = "103.74.201.23"
network_addr = "10.100.0"
vm_image = "Ubuntu20-Mini"
vm_name = "demo-vm"
catalog_name  = "demo"
template_name = "Ubuntu 20.04 Server (demo)"
demo_hostname = "demovm"