variable "name" {
  description = "Name of the Azure Cache for Redis instance"
  type        = string

  validation {
    condition = (
      length(var.name) >= 1 &&
      length(var.name) <= 63 &&
      can(regex("^[a-z0-9]+(-[a-z0-9]+)*$", var.name))
    )
    error_message = "The Redis name must use lowercase letters, numbers, and single hyphens, and cannot start or end with a hyphen."
  }
}

variable "resource_group_name" {
  description = "Name of the resource group containing Redis"
  type        = string
}

variable "location" {
  description = "Azure region for Redis"
  type        = string
}

variable "sku_name" {
  description = "Azure Cache for Redis SKU"
  type        = string
  default     = "Basic"

  validation {
    condition     = contains(["Basic", "Standard"], var.sku_name)
    error_message = "sku_name must be Basic or Standard."
  }
}

variable "capacity" {
  description = "Redis capacity for the C family"
  type        = number
  default     = 0

  validation {
    condition = (
      var.capacity >= 0 &&
      var.capacity <= 6 &&
      floor(var.capacity) == var.capacity
    )
    error_message = "capacity must be a whole number from 0 to 6."
  }
}

variable "tags" {
  description = "Tags applied to Redis"
  type        = map(string)
  default     = {}
}