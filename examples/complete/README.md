# tf-azurerm-collection_module-firewall
 This module demonstrates creation of multiple firewalls using same terraform module using standard naming convention.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_firewall"></a> [firewall](#module\_firewall) | ../.. | n/a |
| <a name="module_network"></a> [network](#module\_network) | git::https://github.com/nexient-llc/tf-azurerm-collection_module-virtual_network.git | fix/variable_types |
| <a name="module_resource_group_hub"></a> [resource\_group\_hub](#module\_resource\_group\_hub) | git::https://github.com/nexient-llc/tf-azurerm-module-resource_group.git | 0.2.0 |
| <a name="module_resource_names"></a> [resource\_names](#module\_resource\_names) | git::https://github.com/nexient-llc/tf-module-resource_name.git | 1.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_name"></a> [client\_name](#input\_client\_name) | Client name/account used in naming | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Project environment | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure region to use | `string` | n/a | yes |
| <a name="input_location_short"></a> [location\_short](#input\_location\_short) | Short string for Azure location. | `string` | n/a | yes |
| <a name="input_logs_destinations_ids"></a> [logs\_destinations\_ids](#input\_logs\_destinations\_ids) | List of destination resources IDs for logs diagnostic destination. Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set. If you want to specify an Azure EventHub to send logs and metrics to, you need to provide a formated string with both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the `|` character. | `list(string)` | `[]` | no |
| <a name="input_stack"></a> [stack](#input\_stack) | Project stack name | `string` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | The address prefix to use for the firewall's subnet | `string` | n/a | yes |
| <a name="input_additional_public_ips"></a> [additional\_public\_ips](#input\_additional\_public\_ips) | List of additional public ips' ids to attach to the firewall. | <pre>list(object(<br>    {<br>      name                 = string,<br>      public_ip_address_id = string<br>  }))</pre> | `[]` | no |
| <a name="input_application_rule_collections"></a> [application\_rule\_collections](#input\_application\_rule\_collections) | Create an application rule collection | <pre>list(object(<br>    {<br>      name     = string,<br>      priority = number,<br>      action   = string,<br>      rules = list(object(<br>        { name             = string,<br>          source_addresses = list(string),<br>          source_ip_groups = list(string),<br>          target_fqdns     = list(string),<br>          protocols = list(object(<br>            { port = string,<br>          type = string }))<br>        }<br>      ))<br>  }))</pre> | `null` | no |
| <a name="input_custom_diagnostic_settings_name"></a> [custom\_diagnostic\_settings\_name](#input\_custom\_diagnostic\_settings\_name) | Custom name of the diagnostics settings, name will be 'default' if not set. | `string` | `"default"` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add | `map(string)` | `{}` | no |
| <a name="input_firewall_private_ip_ranges"></a> [firewall\_private\_ip\_ranges](#input\_firewall\_private\_ip\_ranges) | A list of SNAT private CIDR IP ranges, or the special string `IANAPrivateRanges`, which indicates Azure Firewall does not SNAT when the destination IP address is a private range per IANA RFC 1918. | `list(string)` | <pre>[<br>  "IANAPrivateRanges"<br>]</pre> | no |
| <a name="input_network_rule_collections"></a> [network\_rule\_collections](#input\_network\_rule\_collections) | Create a network rule collection | <pre>list(object({<br>    name     = string,<br>    priority = number,<br>    action   = string,<br>    rules = list(object({<br>      name                  = string,<br>      source_addresses      = list(string),<br>      source_ip_groups      = optional(list(string)),<br>      destination_ports     = list(string),<br>      destination_addresses = list(string),<br>      destination_ip_groups = optional(list(string)),<br>      destination_fqdns     = optional(list(string)),<br>      protocols             = list(string)<br>    }))<br>  }))</pre> | `null` | no |
| <a name="input_public_ip_custom_name"></a> [public\_ip\_custom\_name](#input\_public\_ip\_custom\_name) | Custom name for the public IP | `string` | `null` | no |
| <a name="input_public_ip_zones"></a> [public\_ip\_zones](#input\_public\_ip\_zones) | (Optional)Public IP zones to configure. | `list(number)` | <pre>[<br>  1,<br>  2,<br>  3<br>]</pre> | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | SKU tier of the Firewall. Possible values are `Premium` and `Standard` | `string` | `"Standard"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | (Optional)Specifies a list of Availability Zones in which this Azure Firewall should be located. Changing this forces a new Azure Firewall to be created. | `list(number)` | `null` | no |
| <a name="input_resource_names_map"></a> [resource\_names\_map](#input\_resource\_names\_map) | A map of key to resource\_name that will be used by tf-module-resource\_name to generate resource names | <pre>map(object({<br>    name       = string<br>    max_length = optional(number, 60)<br>    region     = optional(string, "eastus2")<br>  }))</pre> | <pre>{<br>  "firewall": {<br>    "max_length": 80,<br>    "name": "fw",<br>    "region": "eastus"<br>  },<br>  "hub_vnet": {<br>    "max_length": 80,<br>    "name": "hubvnet",<br>    "region": "eastus"<br>  },<br>  "hub_vnet_ip_configuration": {<br>    "max_length": 80,<br>    "name": "ipconfig",<br>    "region": "eastus"<br>  },<br>  "public_ip": {<br>    "max_length": 80,<br>    "name": "pip",<br>    "region": "eastus"<br>  },<br>  "resource_group_hub": {<br>    "max_length": 80,<br>    "name": "rg",<br>    "region": "eastus"<br>  }<br>}</pre> | no |
| <a name="input_naming_prefix"></a> [naming\_prefix](#input\_naming\_prefix) | Prefix for the provisioned resources. | `string` | `"platform"` | no |
| <a name="input_environment_number"></a> [environment\_number](#input\_environment\_number) | The environment count for the respective environment. Defaults to 000. Increments in value of 1 | `string` | `"001"` | no |
| <a name="input_resource_number"></a> [resource\_number](#input\_resource\_number) | The resource count for the respective resource. Defaults to 000. Increments in value of 1 | `string` | `"001"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region in which the infra needs to be provisioned | `string` | `"eastus2"` | no |
| <a name="input_logical_product_family"></a> [logical\_product\_family](#input\_logical\_product\_family) | (Required) Name of the product family for which the resource is created.<br>    Example: org\_name, department\_name. | `string` | `"launch"` | no |
| <a name="input_logical_product_service"></a> [logical\_product\_service](#input\_logical\_product\_service) | (Required) Name of the product service for which the resource is created.<br>    For example, backend, frontend, middleware etc. | `string` | `"network"` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used the virtual network. | `list(string)` | n/a | yes |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | The address prefixes to use for the subnet. | `list(string)` | n/a | yes |
| <a name="input_bgp_community"></a> [bgp\_community](#input\_bgp\_community) | The BGP community to use for the virtual network. | `string` | `null` | no |
| <a name="input_ddos_protection_plan"></a> [ddos\_protection\_plan](#input\_ddos\_protection\_plan) | The DDoS protection plan to associate with the virtual network. | <pre>object(<br>    {<br>      enable = bool<br>      id     = string<br>    }<br>  )</pre> | `null` | no |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | The IDs of the network security groups to associate with the subnet. | `map(string)` | `{}` | no |
| <a name="input_route_tables_ids"></a> [route\_tables\_ids](#input\_route\_tables\_ids) | The IDs of the route tables to associate with the subnet. | `map(string)` | `{}` | no |
| <a name="input_subnet_delegation"></a> [subnet\_delegation](#input\_subnet\_delegation) | The subnet delegation to associate with the subnet. | `map(map(any))` | `{}` | no |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies) | Controls if private link endpoint network policies should be enforced on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies"></a> [subnet\_enforce\_private\_link\_service\_network\_policies](#input\_subnet\_enforce\_private\_link\_service\_network\_policies) | Controls if private link service network policies should be enforced on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | value of the service endpoints to associate with the subnet. | `map(list(string))` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_tracing_tags_enabled"></a> [tracing\_tags\_enabled](#input\_tracing\_tags\_enabled) | Controls if tracing tags should be enabled on the subnet. | `bool` | `false` | no |
| <a name="input_tracing_tags_prefix"></a> [tracing\_tags\_prefix](#input\_tracing\_tags\_prefix) | The prefix to use for the subnet tracing tag. | `string` | `""` | no |
| <a name="input_use_for_each"></a> [use\_for\_each](#input\_use\_for\_each) | Controls if the subnet should be created for each. | `bool` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewalls"></a> [firewalls](#output\_firewalls) | The output of the firwall module |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
