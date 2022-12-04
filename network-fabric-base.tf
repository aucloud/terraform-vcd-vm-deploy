/*
	Copyright (C) 2022 Sovereign Cloud Australia Pty. Ltd.
	All rights reserved.
*/

resource "vcd_network_routed_v2" "Network" {
  org             = var.org
  name            = "Network-Cluster"
  description     = "Network Subnet"
  edge_gateway_id = data.vcd_nsxt_edgegateway.edge_gateway.id
  gateway         = "${var.network_addr}.1"
  prefix_length   = 24
}
resource "vcd_nsxt_network_dhcp" "Network" {
  org_network_id = vcd_network_routed_v2.Network.id

  pool {
    start_address = "${var.network_addr}.10"
    end_address   = "${var.network_addr}.100"
  }
  dns_servers = ["8.8.8.8", "1.1.1.1"]
}
resource "vcd_nsxt_ip_set" "NetworkIPs" {

  edge_gateway_id = data.vcd_nsxt_edgegateway.edge_gateway.id
  name            = "Network-Cluster"
  description     = "IP Set for Network ${var.network_addr}.0/24"
  ip_addresses    = ["${var.network_addr}.0/24"]
}
resource "vcd_vapp" "network_app" {
  name = "demo"
}
resource "vcd_vapp_org_network" "network_net" {
  vapp_name        = vcd_vapp.network_app.name
  org_network_name = vcd_network_routed_v2.Network.name
}
resource "vcd_nsxt_ip_set" "appliance_ip" {
  edge_gateway_id = data.vcd_nsxt_edgegateway.edge_gateway.id

  name        = "Network-Appliance"
  description = "IP Set for VM"

}

resource "vcd_nsxt_ip_set" "External-Source" {

  edge_gateway_id = data.vcd_nsxt_edgegateway.edge_gateway.id

  name        = "External-Source"
  description = "IP Set for DNAT External Source"

  ip_addresses = [
    var.network_public_ip
  ]
}
resource "vcd_nsxt_ip_set" "vip_ipset" {

  edge_gateway_id = data.vcd_nsxt_edgegateway.edge_gateway.id

  name        = "Network-VIP"
  description = "IP Set for VIP"

  ip_addresses = [
    var.network_public_vip
  ]
}
resource "vcd_nsxt_nat_rule" "SNAT-network" {
  org = var.org

  edge_gateway_id = data.vcd_nsxt_edgegateway.edge_gateway.id

  name        = "SNAT-Network to Internet"
  rule_type   = "SNAT"
  description = "Network to Internet"

  external_address = var.network_public_ip
  internal_address = "${var.network_addr}.0/24"

  logging = false
}
resource "vcd_nsxt_nat_rule" "DNAT-network" {
  depends_on = [vcd_vapp_vm.demo_vm]

  org             = var.org
  edge_gateway_id = data.vcd_nsxt_edgegateway.edge_gateway.id

  name        = "DNAT-Internet to Network"
  rule_type   = "DNAT"
  description = "Internet to Network"

  external_address = var.network_public_ip
  internal_address = vcd_vapp_vm.demo_vm.network[0].ip

  dnat_external_port = 80

  logging = false
}


 