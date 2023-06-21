variable "az_res_group" {
  type        = string
  description = "Azure resource group"
}

variable "az_tags" {
  type        = map(string)
  default     = {}
  description = "Tags to attach to Azure resources"
}

variable "az_acr_name" {
  type        = string
  description = "ACR name"
}

// See this page describing SKU for ACR:
// https://learn.microsoft.com/en-us/azure/container-registry/container-registry-skus
variable "az_acr_sku" {
  type        = string
  default     = "Standard"
  description = "SKU for ACR"
}
