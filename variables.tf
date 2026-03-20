variable "organization_id" {
  type        = string
  description = "The ID of the organization to create the network in"
  validation {
    condition     = length(var.organization_id) > 0
    error_message = "Organization ID must be provided"
  }
}

variable "network_name" {
  type        = string
  description = "The name of the network to create"
  default     = "City_ST"
}

variable "network_description" {
  type        = string
  description = "The description of the network to create"
  default     = ""
}

variable "emm_network" {
  type        = bool
  description = "Whether the network is an EMM network"
  default     = false

  validation {
    condition     = var.emm_network == true ? var.vlans_enabled == false : true
    error_message = "VLANs must be disabled for EMM networks"
  }
}

variable "time_zone" {
  type        = string
  description = "The time zone of the network to create"
  default     = "America/New_York"
}

variable "product_types" {
  type        = list(string)
  description = "The product types of the network to create"
  default     = ["appliance", "switch", "wireless"]
  validation {
    condition     = length(var.product_types) > 0
    error_message = "At least one product type must be provided"
  }
}

variable "network_tags" {
  type        = list(string)
  description = "The tags of the network to create"
  default     = ["managed_by_tofu"]
}

variable "vlans_enabled" {
  type        = bool
  description = "Whether to enable VLANs for the network"
  default     = false
}

variable "webhooks" {
  type = map(object({
    name                                 = string
    url                                  = string
    payload_template_name                = string
    payload_template_payload_template_id = string
    shared_secret                        = string
  }))
  default = {}
}

variable "syslog_servers" {
  type = map(object({
    host     = string
    port     = number
    protocol = optional(string, "UDP")
    roles    = list(string)
  }))
  default = {}
}

variable "gateway" {
  type = object({
    serial          = string
    address         = optional(string, "")
    latitude        = optional(number, 0)
    longitude       = optional(number, 0)
    move_map_marker = optional(bool, false)
    name            = optional(string, "")
    notes           = optional(string, "")
    tags            = optional(list(string), ["managed_by_tofu"])
  })
  description = "The gateway configuration for the network"
  default = {
    serial          = ""
    address         = ""
    latitude        = 0
    longitude       = 0
    move_map_marker = false
    name            = ""
    notes           = ""
    tags            = ["managed_by_tofu"]
  }
}

variable "switches" {
  type = map(object({
    serial          = string
    address         = optional(string, "")
    latitude        = optional(number, 0)
    longitude       = optional(number, 0)
    move_map_marker = optional(bool, false)
    notes           = optional(string, "")
    tags            = optional(list(string), ["managed_by_tofu"])
  }))
  description = "Switches keyed by device name"
  default     = {}
}

variable "access_points" {
  type = map(object({
    serial          = string
    address         = optional(string, "")
    latitude        = optional(number, 0)
    longitude       = optional(number, 0)
    move_map_marker = optional(bool, false)
    notes           = optional(string, "")
    tags            = optional(list(string), ["managed_by_tofu"])
  }))
  description = "Access points keyed by device name"
  default     = {}
}

variable "switch_stacks" {
  type = map(object({
    switch_keys = list(string)
  }))
  default = {}
}
