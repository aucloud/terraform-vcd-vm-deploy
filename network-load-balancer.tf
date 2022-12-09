/*
	Copyright (C) 2022 Sovereign Cloud Australia Pty. Ltd.
	All rights reserved.
*/

resource "vcd_nsxt_alb_pool" "apache_http" {
  depends_on      = [vcd_vapp_vm.demo_vm]
  org             = var.org
  name            = "apache-http"
  edge_gateway_id = data.vcd_nsxt_edgegateway.edge_gateway.id
  default_port    = 80
  member {
    enabled    = true
    ip_address = vcd_vapp_vm.demo_vm.network[0].ip
    ratio      = 1
  }
  health_monitor {
    type = "TCP"
  }
}


resource "vcd_nsxt_alb_virtual_service" "global_server" {
  org = var.org

  name            = "global_VIP"
  edge_gateway_id = data.vcd_nsxt_edgegateway.edge_gateway.id

  pool_id                  = vcd_nsxt_alb_pool.apache_http.id
  service_engine_group_id  = data.vcd_nsxt_alb_edgegateway_service_engine_group.first.service_engine_group_id
  virtual_ip_address       = var.network_public_vip
  application_profile_type = "HTTP"

  service_port {
    start_port = 80
    type       = "TCP_PROXY"
  }
}
