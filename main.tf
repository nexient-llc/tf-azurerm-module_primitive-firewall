// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module "firewall" {
  source  = "claranet/firewall/azurerm"
  version = "6.5.0"

  for_each = var.firewall_map

  client_name                     = each.value.client_name
  environment                     = each.value.environment
  location                        = each.value.location
  location_short                  = each.value.location_short
  logs_destinations_ids           = each.value.logs_destinations_ids
  resource_group_name             = each.value.resource_group_name
  stack                           = each.value.stack
  subnet_cidr                     = each.value.subnet_cidr
  virtual_network_name            = each.value.virtual_network_name
  additional_public_ips           = each.value.additional_public_ips
  application_rule_collections    = each.value.application_rule_collections
  network_rule_collections        = each.value.network_rule_collections
  custom_diagnostic_settings_name = each.value.custom_diagnostic_settings_name
  custom_firewall_name            = each.value.custom_firewall_name
  extra_tags                      = each.value.extra_tags
  firewall_private_ip_ranges      = each.value.firewall_private_ip_ranges
  ip_configuration_name           = each.value.ip_configuration_name
  public_ip_custom_name           = each.value.public_ip_custom_name
  public_ip_zones                 = each.value.public_ip_zones
  sku_tier                        = each.value.sku_tier
  zones                           = each.value.zones
  firewall_policy_id              = each.value.firewall_policy_id
}
