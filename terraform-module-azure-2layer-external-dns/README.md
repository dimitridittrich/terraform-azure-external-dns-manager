<!-- BEGIN_TF_DOCS -->
# TERRAFORM-MODULES-EXTERNAL-DNS
This module is of second layer because it calls the following resources XXXXX, for the following purpose of product XXXX

---
## Changelog
| Name | Description | Version |
|------|---------|---------|
|Dimitri Dittrich | 1.0.1 |
---
#### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.21.1 |
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_a_records"></a> [dns\_a\_records](#input\_dns\_a\_records) | List of objects containing the variables needed for the A records | <pre>list(object({<br>    records        = list(string) #(Required) List of IPv4 Addresses. (type A)<br>    ttl            = number #(Required) The Time To Live (TTL) of the A DNS record in seconds. Default is 3600<br>    name           = string #(Required) The name of the DNS A Record.<br>  }))</pre> | <pre>[<br>  {<br>    "name": null,<br>    "records": [],<br>    "ttl": 3600<br>  }<br>]</pre> | no |
| <a name="input_dns_cname_records"></a> [dns\_cname\_records](#input\_dns\_cname\_records) | List of objects containing the variables needed for the CNAME records | <pre>list(object({<br>    name           = string #(Required) The name of the DNS CNAME Record.<br>    record         = string #(Required) The target of the CNAME.<br>    ttl            = number #(Required) The Time To Live (TTL) of the CNAME DNS record in seconds. Default is 3600<br>  }))</pre> | <pre>[<br>  {<br>    "name": null,<br>    "record": null,<br>    "ttl": 3600<br>  }<br>]</pre> | no |
| <a name="input_dns_mx_records"></a> [dns\_mx\_records](#input\_dns\_mx\_records) | List of objects containing the variables needed for the MX records | <pre>list(object({<br>    name           = string #(Required) The name of the DNS MX Record.<br>    record         = list(object({ #string #(Required) The target of the MX.<br>      preference   = number<br>      exchange     = string<br>    })) <br>    ttl            = number #(Required) The Time To Live (TTL) of the MX DNS record in seconds. Default is 3600<br>  }))</pre> | <pre>[<br>  {<br>    "name": null,<br>    "record": [<br>      {<br>        "exchange": null,<br>        "preference": 10<br>      }<br>    ],<br>    "ttl": 3600<br>  }<br>]</pre> | no |
| <a name="input_dns_srv_records"></a> [dns\_srv\_records](#input\_dns\_srv\_records) | List of objects containing the variables needed for the srv records | <pre>list(object({<br>    name           = string #(Required) The name of the DNS srv Record.<br>    record         = list(object({ #string #(Required) The target of the srv.<br>      priority     = number<br>      weight       = number<br>      port         = number<br>      target       = string<br>    })) <br>    ttl            = number #(Required) The Time To Live (TTL) of the srv DNS record in seconds. Default is 3600<br>  }))</pre> | <pre>[<br>  {<br>    "name": null,<br>    "record": [<br>      {<br>        "port": null,<br>        "priority": null,<br>        "target": null,<br>        "weight": null<br>      }<br>    ],<br>    "ttl": 3600<br>  }<br>]</pre> | no |
| <a name="input_dns_txt_records"></a> [dns\_txt\_records](#input\_dns\_txt\_records) | List of objects containing the variables needed for the TXT records | <pre>list(object({<br>    name           = string #(Required) The name of the DNS TXT Record.<br>    record         = list(string)#string #(Required) The target of the TXT.<br>    ttl            = number #(Required) The Time To Live (TTL) of the TXT DNS record in seconds. Default is 3600<br>  }))</pre> | <pre>[<br>  {<br>    "name": null,<br>    "record": null,<br>    "ttl": 3600<br>  }<br>]</pre> | no |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | The dns zone name to be created for internal vnet resolution | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where the Azure DNS resides | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |
#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_zone_id"></a> [dns\_zone\_id](#output\_dns\_zone\_id) | The DNS Zone ID. |
| <a name="output_dns_zone_name"></a> [dns\_zone\_name](#output\_dns\_zone\_name) | The name of the DNS Zone. Must be a valid domain name. |

<!-- END_TF_DOCS -->
