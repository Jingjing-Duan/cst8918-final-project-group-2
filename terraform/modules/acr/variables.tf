variable "name" {
  description = "Globally unique name of the Azure Container Registry"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{5,50}$", var.name))
    error_message = "The ACR name must contain 5-50 lowercase letters or numbers only."
  }
}

variable "resource_group_name" {
  description = "Name of the resource group containing the ACR"
  type        = string
}

variable "location" {
  description = "Azure region for the ACR"
  type        = string
}

variable "tags" {
  description = "Tags applied to the ACR"
  type        = map(string)
  default     = {}
}