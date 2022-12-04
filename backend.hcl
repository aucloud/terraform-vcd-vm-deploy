/*
	Copyright (C) 2022 Sovereign Cloud Australia Pty. Ltd.
	All rights reserved.
*/
#Using PDCE sovereignty zone 1, not AWS   
    skip_credentials_validation = true

    skip_metadata_api_check = true

    endpoint = "https://s3-esz101.australiacloud.com.au"

    region = "us-east-1"

    bucket = "terraform-demo"

    key = "apache-demo/apache-terraform.tfstate"