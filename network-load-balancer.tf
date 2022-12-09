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
