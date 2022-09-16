output "dns_zone_name" {
  description = "The name of the DNS Zone. Must be a valid domain name."
  value       = module.dns_zone.dns_zone_name
}

output "dns_zone_id" {
  description = "The DNS Zone ID."
  value       = module.dns_zone.dns_zone_id
}

/*
output "dns_a_record_id" {
  value = { for dns in keys(azurerm_dns_a_record.dns_a_record) : dns => azurerm_dns_a_record.dns_a_record[dns].id }
  #value = azurerm_dns_a_record.dns_a_record[*].id
}

output "dns_a_record_fqdn" {
  value = { for dns in keys(azurerm_dns_a_record.dns_a_record) : dns => azurerm_dns_a_record.dns_a_record[dns].fqdn }
  #value = azurerm_dns_a_record.dns_a_record[*].fqdn
}

output "dns_cname_record_id" {
  value = { for dns in keys(azurerm_dns_cname_record.dns_cname_record) : dns => azurerm_dns_cname_record.dns_cname_record[dns].id }
  #value = azurerm_dns_cname_record.dns_cname_record[*].id
}

output "dns_cname_record_fqdn" {
  value = { for dns in keys(azurerm_dns_cname_record.dns_cname_record) : dns => azurerm_dns_cname_record.dns_cname_record[dns].fqdn }
  #value = azurerm_dns_cname_record.dns_cname_record[*].fqdn
}

*/
