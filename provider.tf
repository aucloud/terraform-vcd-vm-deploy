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

  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "https://s3-esz101.australiacloud.com.au"
    region                      = "us-east-1"
    bucket                      = "terraform-demo"
    key                         = "apache-demo/apache-terraform.tfstate"
  }
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

provider "aws" {
  region = "us-east-1"
  // Use as STS / IAM for cloudian are not exposed
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  endpoints {
    s3 = "https://s3-esz101.australiacloud.com.au"
  }

}