variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "Resource group for Terraform remote state"
  type        = string
  default     = "cst8918-finalproject-g2-backend-rg"
}

variable "storage_account_name" {
  description = "Storage account for Terraform remote state"
  type        = string
  default     = "cst8918g2tfstatestorage"
}
