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

resource "meraki_network_webhook_http_server" "this" {
  for_each = var.webhooks

  name                                 = each.key
  network_id                           = meraki_network.this.id
  url                                  = each.value.url
  payload_template_name                = each.value.payload_template_name
  payload_template_payload_template_id = each.value.payload_template_payload_template_id
  shared_secret                        = each.value.shared_secret
}

resource "meraki_network_syslog_servers" "this" {
  count      = length(var.syslog_servers) > 0 ? 1 : 0
  network_id = meraki_network.this.id
  servers = [
    for _key, s in var.syslog_servers : {
      host     = s.host
      port     = s.port
      protocol = s.protocol
      roles    = s.roles
    }
  ]
}

resource "meraki_device" "gateway" {
  serial          = lookup(var.gateway, "serial", "")
  name            = lookup(var.gateway, "name", "")
  notes           = lookup(var.gateway, "notes", "")
  address         = lookup(var.gateway, "address", "")
  lat             = lookup(var.gateway, "latitude", 0)
  lng             = lookup(var.gateway, "longitude", 0)
  move_map_marker = lookup(var.gateway, "move_map_marker", true)
  tags            = lookup(var.gateway, "tags", ["managed_by_tofu"])
}

resource "meraki_device" "switch" {
  for_each = var.switches

  serial          = lookup(each.value, "serial", "")
  name            = each.key
  notes           = lookup(each.value, "notes", "")
  address         = lookup(each.value, "address", "")
  lat             = lookup(each.value, "latitude", 0)
  lng             = lookup(each.value, "longitude", 0)
  move_map_marker = lookup(each.value, "move_map_marker", true)
  tags            = lookup(each.value, "tags", ["managed_by_tofu"])
}

resource "meraki_device" "access_point" {
  for_each = var.access_points

  serial          = lookup(each.value, "serial", "")
  name            = each.key
  notes           = lookup(each.value, "notes", "")
  address         = lookup(each.value, "address", "")
  lat             = lookup(each.value, "latitude", 0)
  lng             = lookup(each.value, "longitude", 0)
  move_map_marker = lookup(each.value, "move_map_marker", true)
  tags            = lookup(each.value, "tags", ["managed_by_tofu"])
}

resource "meraki_switch_stack" "this" {
  for_each = var.switch_stacks

  network_id = meraki_network.this.id
  name       = each.key
  serials = [
    for switch_key in each.value.switch_keys : var.switches[switch_key].serial
  ]

  lifecycle {
    precondition {
      condition = alltrue([
        for switch_key in each.value.switch_keys : contains(keys(var.switches), switch_key)
      ])
      error_message = "All switch_stacks switch_keys must reference keys in var.switches."
    }
  }
}
