module "dns_zone" {
  source              = "git@ssh.dev.azure.com:v3/AZDEVOPS-ORGANIZATION/AZDEVOPS-PROJECT/terraform-module-azurerm-dns-zone?ref=1.0.0"  
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
  tags                = {} #module.tags.default

   lifecycle {
    ignore_changes = [
      soa_record,tags
    ]
  }
}

resource "azurerm_dns_a_record" "dns_a_record" {
  depends_on = [
  module.dns_zone
  ]
  for_each            = (var.dns_a_records != null) ? { for dns_a_record in var.dns_a_records : dns_a_record.name => dns_a_record } : {}
  name                = each.value.name
  zone_name           = var.dns_zone_name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records
    lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_dns_cname_record" "dns_cname_record" {
  depends_on = [
  module.dns_zone
  ]
  for_each            = (var.dns_cname_records != null) ? { for dns_cname_record in var.dns_cname_records : dns_cname_record.name => dns_cname_record } : {}
  name                = each.value.name
  zone_name           = var.dns_zone_name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.record
    lifecycle {
    ignore_changes = [
      tags,
    ]
    }
}

resource "azurerm_dns_txt_record" "dns_txt_record" {
  depends_on = [
  module.dns_zone
  ]
  for_each            = (var.dns_txt_records != null) ? { for dns_txt_record in var.dns_txt_records : dns_txt_record.name => dns_txt_record } : {}
  name                = each.value.name
  zone_name           = var.dns_zone_name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
    dynamic "record" {
      for_each        = each.value.record
    content {
      value = record.value
    }
  }
    lifecycle {
    ignore_changes = [
      tags,
    ]
    }
}

resource "azurerm_dns_mx_record" "dns_mx_record" {
  depends_on = [
  module.dns_zone
  ]
  for_each            = (var.dns_mx_records != null) ? { for dns_mx_record in var.dns_mx_records : dns_mx_record.name => dns_mx_record } : {}
  name                = each.value.name
  zone_name           = var.dns_zone_name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
    dynamic "record" {
      for_each        = each.value.record
    content {
      preference = record.value.preference
      exchange   = record.value.exchange
    }
  }
    lifecycle {
    ignore_changes = [
      tags,
    ]
    }
}

resource "azurerm_dns_srv_record" "dns_srv_record" {
  depends_on = [
  module.dns_zone
  ]
  for_each            = (var.dns_srv_records != null) ? { for dns_srv_record in var.dns_srv_records : dns_srv_record.name => dns_srv_record } : {}
  name                = each.value.name
  zone_name           = var.dns_zone_name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
    dynamic "record" {
      for_each        = each.value.record
    content {
      priority    = record.value.priority
      weight      = record.value.weight
      port        = record.value.port
      target      = record.value.target
    }
  }
    lifecycle {
    ignore_changes = [
      tags,
    ]
    }
}