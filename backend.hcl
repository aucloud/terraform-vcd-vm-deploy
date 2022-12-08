/*
	Copyright (C) 2022 Sovereign Cloud Australia Pty. Ltd.
	All rights reserved.
*/
   
    skip_credentials_validation = true // Using PDCE sovereignty zone 1, not AWS

    skip_metadata_api_check = true // Using PDCE sovereignty zone 1, not AWS

    endpoint = "https://s3-esz101.australiacloud.com.au" // PDCE Cloudian direct endpoint

    region = "us-east-1" // Not used leave as default

    bucket = "terraform-demo"

    key = "apache-demo/apache-terraform.tfstate"