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
  count           = length(var.switches) > 0 ? length(var.switches) : 0
  serial          = lookup(var.switches[count.index], "serial", "")
  name            = lookup(var.switches[count.index], "name", "")
  notes           = lookup(var.switches[count.index], "notes", "")
  address         = lookup(var.switches[count.index], "address", "")
  lat             = lookup(var.switches[count.index], "latitude", 0)
  lng             = lookup(var.switches[count.index], "longitude", 0)
  move_map_marker = lookup(var.switches[count.index], "move_map_marker", true)
  tags            = lookup(var.switches[count.index], "tags", ["managed_by_tofu"])
}

resource "meraki_device" "access_point" {
  count           = length(var.access_points) > 0 ? length(var.access_points) : 0
  serial          = lookup(var.access_points[count.index], "serial", "")
  name            = lookup(var.access_points[count.index], "name", "")
  notes           = lookup(var.access_points[count.index], "notes", "")
  address         = lookup(var.access_points[count.index], "address", "")
  lat             = lookup(var.access_points[count.index], "latitude", 0)
  lng             = lookup(var.access_points[count.index], "longitude", 0)
  move_map_marker = lookup(var.access_points[count.index], "move_map_marker", true)
  tags            = lookup(var.access_points[count.index], "tags", ["managed_by_tofu"])
}
