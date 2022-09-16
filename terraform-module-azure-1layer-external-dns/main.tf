resource "azurerm_dns_zone" "main" {
  name                = var.name
  resource_group_name = var.resource_group_name
  tags = var.tags

  lifecycle {
    ignore_changes = [
      soa_record,
    ]
  }
}