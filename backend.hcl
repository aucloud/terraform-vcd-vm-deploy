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

    skip_credentials_validation = true // Using PDCE sovereignty zone 1, not AWS

    skip_metadata_api_check = true // Using PDCE sovereignty zone 1, not AWS

    endpoint = "https://s3-esz101.australiacloud.com.au" // PDCE Cloudian direct endpoint

    region = "us-east-1" // Not used leave as default

    bucket = "terraform-demo"

    key = "apache-demo/apache-terraform.tfstate"