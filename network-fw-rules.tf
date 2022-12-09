/*
	Copyright (C) 2022 Sovereign Cloud Australia Pty. Ltd.
	All rights reserved.
*/

resource "vcd_nsxt_firewall" "network_fw" {
  org = var.org

  edge_gateway_id = data.vcd_nsxt_edgegateway.edge_gateway.id

  // Internal Network to Internet
  rule {
    name        = "Network-Internet"
    direction   = "OUT"
    action      = "ALLOW"
    source_ids  = [vcd_nsxt_ip_set.NetworkIPs.id]
    ip_protocol = "IPV4"
  }

  // external to vip over 80
  rule {
    name                 = "External-VIP"
    direction            = "IN_OUT"
    action               = "ALLOW"
    destination_ids      = [vcd_nsxt_ip_set.vip_ipset.id]
    app_port_profile_ids = [data.vcd_nsxt_app_port_profile.HTTP.id]
    ip_protocol          = "IPV4"
  }

  // DNAT External sources to Internal Subnet on 80
  rule {
    name                 = "DNAT-External-to-Network"
    direction            = "IN_OUT"
    action               = "ALLOW"
    source_ids           = [vcd_nsxt_ip_set.External-Source.id]
    destination_ids      = [vcd_nsxt_ip_set.appliance_ip.id]
    app_port_profile_ids = [data.vcd_nsxt_app_port_profile.HTTP.id]
    ip_protocol          = "IPV4"
  }
}