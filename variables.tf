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

variable "firewall_map" {
  description = "Map of azure firewalls where name is key, and value is object containing attributes to create a azure firewall"
  type = map(object({
    client_name           = string
    environment           = string
    location              = string
    location_short        = string
    logs_destinations_ids = list(string)
    resource_group_name   = string
    stack                 = string
    subnet_cidr           = optional(string)
    virtual_network_name  = string
    firewall_policy_id    = optional(string)
    additional_public_ips = optional(list(object(
      {
        name                 = string,
        public_ip_address_id = string
    })))
    application_rule_collections = optional(list(object(
      {
        name     = string,
        priority = number,
        action   = string,
        rules = list(object(
          { name             = string,
            source_addresses = list(string),
            source_ip_groups = list(string),
            target_fqdns     = list(string),
            protocols = list(object(
              { port = string,
            type = string }))
          }
        ))
    })))
    custom_diagnostic_settings_name = optional(string)
    custom_firewall_name            = optional(string)
    dns_servers                     = optional(string)
    extra_tags                      = optional(map(string))
    firewall_private_ip_ranges      = optional(list(string))
    ip_configuration_name           = optional(string)
    network_rule_collections = optional(list(object({
      name     = string,
      priority = number,
      action   = string,
      rules = list(object({
        name                  = string,
        source_addresses      = list(string),
        source_ip_groups      = optional(list(string)),
        destination_ports     = list(string),
        destination_addresses = list(string),
        destination_ip_groups = optional(list(string)),
        destination_fqdns     = optional(list(string)),
        protocols             = list(string)
      }))
    })))
    public_ip_custom_name = optional(string)
    public_ip_zones       = optional(list(number))
    sku_tier              = optional(string)
    zones                 = optional(list(number))
  }))
  default = {}
}
