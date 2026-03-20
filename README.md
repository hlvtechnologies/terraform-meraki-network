# 📦 Meraki Network Tofu Module

OpenTofu/Terraform module that creates a [Cisco Meraki network](https://developer.cisco.com/meraki/api-v1/) resource and attaches all of the trimmings.

## 🚀 Usage

```hcl
module "meraki_network_somewhere_usa" {
  source  = "hlvtechnologies/meraki-network"
  version = "~> 0.3"

  organization_id = "123456"
  network_name    = "Somewhere_USA"
  vlans_enabled   = false
  webhooks        = {}
  syslog_servers  = []
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0 |
| <a name="requirement_meraki"></a> [meraki](#requirement\_meraki) | >= 1.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_meraki"></a> [meraki](#provider\_meraki) | >= 1.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [meraki_appliance_vlans_settings.this](https://registry.terraform.io/providers/ciscodevnet/meraki/latest/docs/resources/appliance_vlans_settings) | resource |
| [meraki_device.access_point](https://registry.terraform.io/providers/ciscodevnet/meraki/latest/docs/resources/device) | resource |
| [meraki_device.gateway](https://registry.terraform.io/providers/ciscodevnet/meraki/latest/docs/resources/device) | resource |
| [meraki_device.switch](https://registry.terraform.io/providers/ciscodevnet/meraki/latest/docs/resources/device) | resource |
| [meraki_network.this](https://registry.terraform.io/providers/ciscodevnet/meraki/latest/docs/resources/network) | resource |
| [meraki_network_syslog_servers.this](https://registry.terraform.io/providers/ciscodevnet/meraki/latest/docs/resources/network_syslog_servers) | resource |
| [meraki_network_webhook_http_server.this](https://registry.terraform.io/providers/ciscodevnet/meraki/latest/docs/resources/network_webhook_http_server) | resource |
| [meraki_switch_stack.this](https://registry.terraform.io/providers/ciscodevnet/meraki/latest/docs/resources/switch_stack) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_points"></a> [access\_points](#input\_access\_points) | Access points keyed by device name | <pre>map(object({<br/>    serial          = string<br/>    address         = optional(string, "")<br/>    latitude        = optional(number, 0)<br/>    longitude       = optional(number, 0)<br/>    move_map_marker = optional(bool, false)<br/>    notes           = optional(string, "")<br/>    tags            = optional(list(string), ["managed_by_tofu"])<br/>  }))</pre> | `{}` | no |
| <a name="input_emm_network"></a> [emm\_network](#input\_emm\_network) | Whether the network is an EMM network | `bool` | `false` | no |
| <a name="input_gateway"></a> [gateway](#input\_gateway) | The gateway configuration for the network | <pre>object({<br/>    serial          = string<br/>    address         = optional(string, "")<br/>    latitude        = optional(number, 0)<br/>    longitude       = optional(number, 0)<br/>    move_map_marker = optional(bool, false)<br/>    name            = optional(string, "")<br/>    notes           = optional(string, "")<br/>    tags            = optional(list(string), ["managed_by_tofu"])<br/>  })</pre> | <pre>{<br/>  "address": "",<br/>  "latitude": 0,<br/>  "longitude": 0,<br/>  "move_map_marker": false,<br/>  "name": "",<br/>  "notes": "",<br/>  "serial": "",<br/>  "tags": [<br/>    "managed_by_tofu"<br/>  ]<br/>}</pre> | no |
| <a name="input_network_description"></a> [network\_description](#input\_network\_description) | The description of the network to create | `string` | `""` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the network to create | `string` | `"City_ST"` | no |
| <a name="input_network_tags"></a> [network\_tags](#input\_network\_tags) | The tags of the network to create | `list(string)` | <pre>[<br/>  "managed_by_tofu"<br/>]</pre> | no |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | The ID of the organization to create the network in | `string` | n/a | yes |
| <a name="input_product_types"></a> [product\_types](#input\_product\_types) | The product types of the network to create | `list(string)` | <pre>[<br/>  "appliance",<br/>  "switch",<br/>  "wireless"<br/>]</pre> | no |
| <a name="input_switch_stacks"></a> [switch\_stacks](#input\_switch\_stacks) | n/a | <pre>map(object({<br/>    switch_keys = list(string)<br/>  }))</pre> | `{}` | no |
| <a name="input_switches"></a> [switches](#input\_switches) | Switches keyed by device name | <pre>map(object({<br/>    serial          = string<br/>    address         = optional(string, "")<br/>    latitude        = optional(number, 0)<br/>    longitude       = optional(number, 0)<br/>    move_map_marker = optional(bool, false)<br/>    notes           = optional(string, "")<br/>    tags            = optional(list(string), ["managed_by_tofu"])<br/>  }))</pre> | `{}` | no |
| <a name="input_syslog_servers"></a> [syslog\_servers](#input\_syslog\_servers) | n/a | <pre>map(object({<br/>    host     = string<br/>    port     = number<br/>    protocol = optional(string, "UDP")<br/>    roles    = list(string)<br/>  }))</pre> | `{}` | no |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | The time zone of the network to create | `string` | `"America/New_York"` | no |
| <a name="input_vlans_enabled"></a> [vlans\_enabled](#input\_vlans\_enabled) | Whether to enable VLANs for the network | `bool` | `false` | no |
| <a name="input_webhooks"></a> [webhooks](#input\_webhooks) | n/a | <pre>map(object({<br/>    name                                 = string<br/>    url                                  = string<br/>    payload_template_name                = string<br/>    payload_template_payload_template_id = string<br/>    shared_secret                        = string<br/>  }))</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). This project is licensed under the [MIT License](LICENSE).

## 🧩 Template repository

If you created this repository from a template, see [TEMPLATE.md](TEMPLATE.md) for setup steps.
