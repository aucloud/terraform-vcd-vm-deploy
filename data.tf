/*
	Copyright (C) 2022 Sovereign Cloud Australia Pty. Ltd.
	All rights reserved.
*/

data "vcd_org_vdc" "nsxt_vdc" {
  name = var.vdc
}

data "vcd_nsxt_edgegateway" "edge_gateway" {
  owner_id = data.vcd_org_vdc.nsxt_vdc.id
  name     = var.edge_gateway
}

data "vcd_nsxt_alb_edgegateway_service_engine_group" "first" {
  org = var.org

  service_engine_group_name = "ALB-SE-Group-001"
  edge_gateway_id           = data.vcd_nsxt_edgegateway.edge_gateway.id
}

data "vcd_nsxt_app_port_profile" "DNS-UDP" {
  scope = "SYSTEM"
  name  = "DNS-UDP"
}

data "vcd_nsxt_app_port_profile" "DNS-TCP" {
  scope = "SYSTEM"
  name  = "DNS"
}

data "vcd_nsxt_app_port_profile" "HTTP" {
  scope = "SYSTEM"
  name  = "HTTP"
}

data "vcd_nsxt_app_port_profile" "HTTPS" {
  scope = "SYSTEM"
  name  = "HTTPS"
}

data "terraform_remote_state" "apache" {

  backend = "s3"

  config = {

    skip_credentials_validation = true

    skip_metadata_api_check = true

    endpoint = "https://s3-esz101.australiacloud.com.au"

    region = "us-east-1"

    bucket = "terraform-demo"

    key = "apache-demo/apache-terraform.tfstate"

  }

}