variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the AKS cluster"
  type        = string
}

variable "location" {
  description = "Azure region for the AKS cluster"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID used by the AKS node pool"
  type        = string
}

variable "acr_id" {
  description = "Resource ID of the ACR that AKS can pull images from"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version required by the project"
  type        = string
  default     = "1.32"
}

variable "sku_tier" {
  description = "AKS pricing tier"
  type        = string
  default     = "Premium"

  validation {
    condition     = contains(["Free", "Standard", "Premium"], var.sku_tier)
    error_message = "sku_tier must be Free, Standard, or Premium."
  }
}

variable "support_plan" {
  description = "AKS Kubernetes support plan"
  type        = string
  default     = "AKSLongTermSupport"

  validation {
    condition = contains(
      ["KubernetesOfficial", "AKSLongTermSupport"],
      var.support_plan
    )
    error_message = "support_plan must be KubernetesOfficial or AKSLongTermSupport."
  }
}

variable "vm_size" {
  description = "VM size used by the default node pool"
  type        = string
  default     = "Standard_B2s"
}

variable "enable_auto_scaling" {
  description = "Whether cluster autoscaling is enabled"
  type        = bool
  default     = false
}

variable "node_count" {
  description = "Fixed node count when autoscaling is disabled"
  type        = number
  default     = 1
}

variable "min_count" {
  description = "Minimum node count when autoscaling is enabled"
  type        = number
  default     = null
}

variable "max_count" {
  description = "Maximum node count when autoscaling is enabled"
  type        = number
  default     = null
}

variable "service_cidr" {
  description = "Kubernetes service network CIDR"
  type        = string
}

variable "dns_service_ip" {
  description = "Kubernetes DNS service IP"
  type        = string
}

variable "tags" {
  description = "Tags applied to AKS resources"
  type        = map(string)
  default     = {}
}