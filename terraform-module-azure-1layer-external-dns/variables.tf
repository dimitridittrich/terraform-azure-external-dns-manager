variable "name" {
  description = "The dns zone name to be created for internal vnet resolution"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Azure DNS resides"
  type        = string
}

variable "tags" {
  type = map(string)
}