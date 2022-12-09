/*
	Copyright (C) 2022 Sovereign Cloud Australia Pty. Ltd.
	All rights reserved.
*/
/*
    provider.tf
    Best practice  - put provider information here.
*/

terraform {
  required_providers {
    vcd = {
      source  = "vmware/vcd"
      version = "~> 3.7"
    }
  }

  backend "s3" {}
}

provider "vcd" {
  user                 = var.user
  password             = var.password
  org                  = var.org
  vdc                  = var.vdc
  url                  = var.url
  max_retry_timeout    = "240"
  allow_unverified_ssl = "true"
}
