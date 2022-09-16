variable "dns_zone_name" {
  description = "The dns zone name to be created for internal vnet resolution"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Azure DNS resides"
  type        = string
}

variable "dns_a_records" {
  type = list(object({
    records        = list(string) #(Required) List of IPv4 Addresses. (type A)
    ttl            = number #(Required) The Time To Live (TTL) of the A DNS record in seconds. Default is 3600
    name           = string #(Required) The name of the DNS A Record.
  }))
  default = [ {
    name = null
    records = []
    ttl = 3600
  } ]
  description = "List of objects containing the variables needed for the A records"
}

variable "dns_cname_records" {
  type = list(object({
    name           = string #(Required) The name of the DNS CNAME Record.
    record         = string #(Required) The target of the CNAME.
    ttl            = number #(Required) The Time To Live (TTL) of the CNAME DNS record in seconds. Default is 3600
  }))
  default = [ {
    name = null
    record = null
    ttl = 3600
  } ]
  description = "List of objects containing the variables needed for the CNAME records"
}

variable "dns_txt_records" {
  type = list(object({
    name           = string #(Required) The name of the DNS TXT Record.
    record         = list(string)#string #(Required) The target of the TXT.
    ttl            = number #(Required) The Time To Live (TTL) of the TXT DNS record in seconds. Default is 3600
  }))
  default = [ {
    name = null
    record = null
    ttl = 3600
  } ]
  description = "List of objects containing the variables needed for the TXT records"
}

variable "dns_mx_records" {
  type = list(object({
    name           = string #(Required) The name of the DNS MX Record.
    record         = list(object({ #string #(Required) The target of the MX.
      preference   = number
      exchange     = string
    })) 
    ttl            = number #(Required) The Time To Live (TTL) of the MX DNS record in seconds. Default is 3600
  }))
  default = [ {
    name = null
    record = [ {
      exchange = null
      preference = 10
    } ]
    ttl = 3600
  } ]
  description = "List of objects containing the variables needed for the MX records"
}

variable "dns_srv_records" {
  type = list(object({
    name           = string #(Required) The name of the DNS srv Record.
    record         = list(object({ #string #(Required) The target of the srv.
      priority     = number
      weight       = number
      port         = number
      target       = string
    })) 
    ttl            = number #(Required) The Time To Live (TTL) of the srv DNS record in seconds. Default is 3600
  }))
  default = [ {
    name = null
    record = [ {
      priority = null
      weight   = null
      port     = null
      target   = null
    } ]
    ttl = 3600
  } ]
  description = "List of objects containing the variables needed for the srv records"
}
