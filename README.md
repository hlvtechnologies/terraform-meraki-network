# 📦 terraform-meraki-network

OpenTofu/Terraform module that creates a [Cisco Meraki network](https://developer.cisco.com/meraki/api-v1/) resource.

## 🚀 Usage

```hcl
module "meraki_organization" {
  source  = "github.com/hlvtechnologies/terraform-meraki-network"
  version = "~> 0.1"

  organization_id = "123456"
  network_name    = "Somewhere_USA"
  vlans_enabled   = false
}
```

Replace `hlvtechnologies/terraform-meraki-network` with your registry namespace or Git source. When publishing to the Terraform Registry, pin `version` to a release (for example `~> 0.1`); for raw Git sources, use `?ref=` on the `source` URL instead of `version`.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_meraki"></a> [meraki](#provider\_meraki) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [meraki_appliance_vlans_settings.this](https://registry.terraform.io/providers/hashicorp/meraki/latest/docs/resources/appliance_vlans_settings) | resource |
| [meraki_network.this](https://registry.terraform.io/providers/hashicorp/meraki/latest/docs/resources/network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_emm_network"></a> [emm\_network](#input\_emm\_network) | Whether the network is an EMM network | `bool` | `false` | no |
| <a name="input_network_description"></a> [network\_description](#input\_network\_description) | The description of the network to create | `string` | `""` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the network to create | `string` | `"City_ST"` | no |
| <a name="input_network_tags"></a> [network\_tags](#input\_network\_tags) | The tags of the network to create | `list(string)` | <pre>[<br/>  "managed_by_tofu"<br/>]</pre> | no |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | The ID of the organization to create the network in | `string` | n/a | yes |
| <a name="input_product_types"></a> [product\_types](#input\_product\_types) | The product types of the network to create | `list(string)` | <pre>[<br/>  "appliance",<br/>  "switch",<br/>  "wireless"<br/>]</pre> | no |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | The time zone of the network to create | `string` | `"America/New_York"` | no |
| <a name="input_vlans_enabled"></a> [vlans\_enabled](#input\_vlans\_enabled) | Whether to enable VLANs for the network | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). This project is licensed under the [MIT License](LICENSE).

## 🧩 Template repository

If you created this repository from a template, see [TEMPLATE.md](TEMPLATE.md) for setup steps.
