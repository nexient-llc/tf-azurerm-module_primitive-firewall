# // Licensed under the Apache License, Version 2.0 (the "License");
# // you may not use this file except in compliance with the License.
# // You may obtain a copy of the License at
# //
# //     http://www.apache.org/licenses/LICENSE-2.0
# //
# // Unless required by applicable law or agreed to in writing, software
# // distributed under the License is distributed on an "AS IS" BASIS,
# // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# // See the License for the specific language governing permissions and
# // limitations under the License.

//outputs by firewall module
output "firewall_ids" {
  value       = { for k, v in var.firewall_map : k => module.firewall[k].firewall_id }
  description = "Firewall generated ids"
}

output "firewall_names" {
  value       = { for k, v in var.firewall_map : k => module.firewall[k].firewall_name }
  description = "Firewall names"
}

output "private_ip_addresses" {
  value       = { for k, v in var.firewall_map : k => module.firewall[k].private_ip_address }
  description = "Firewall private IPs"
}

output "public_ip_addresses" {
  value       = { for k, v in var.firewall_map : k => module.firewall[k].public_ip_address }
  description = "Firewall public IPs"
}

output "subnet_ids" {
  value       = { for k, v in var.firewall_map : k => module.firewall[k].subnet_id }
  description = "IDs of the subnet attached to the firewall"
}
