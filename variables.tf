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

variable "user" {
  type = string
}
variable "password" {
  type = string
}
variable "vdc" {
  type = string
}
variable "org" {
  type = string
}
variable "edge_gateway" {
  type = string
}
variable "url" {
  type = string
}
variable "network_public_ip" {
  type = string
}
variable "network_public_vip" {
  type = string
}
variable "network_addr" {
  type = string
}
variable "vm_image" {
  type = string
}
variable "vm_name" {
  type = string
}
variable "catalog_name" {
  type = string
}
variable "template_name" {
  type = string
}
variable "demo_hostname" {
  type = string
}