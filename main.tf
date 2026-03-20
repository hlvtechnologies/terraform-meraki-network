terraform {
  required_version = ">= 1.10.0"

  required_providers {
    meraki = {
      source  = "ciscodevnet/meraki"
      version = ">= 1.9.0"
    }
  }
}

resource "meraki_network" "this" {
  organization_id = var.organization_id
  name            = var.network_name
  notes           = var.network_description
  time_zone       = var.time_zone
  product_types   = var.product_types
  tags            = var.network_tags
}

moved {
  from = meraki_appliance_vlans_settings.this
  to   = meraki_appliance_vlans_settings.this[0]
}

resource "meraki_appliance_vlans_settings" "this" {
  count = var.emm_network ? 0 : 1

  network_id    = meraki_network.this.id
  vlans_enabled = var.vlans_enabled
}
