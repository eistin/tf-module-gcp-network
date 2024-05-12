<!-- BEGIN_TF_DOCS -->
## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the VPC network to peer. | `string` | n/a | yes |
| <a name="input_network_self_link"></a> [network\_self\_link](#input\_network\_self\_link) | Self link of the VPC network to peer. | `string` | n/a | yes |
| <a name="input_private_services_networks"></a> [private\_services\_networks](#input\_private\_services\_networks) | n/a | <pre>list(object({<br>    name          = string<br>    prefix_length = optional(string)<br>    address       = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID of the VPC network to peer. This can be a shared VPC host projec. | `string` | n/a | yes |
| <a name="input_prefix_length"></a> [prefix\_length](#input\_prefix\_length) | Prefix length of the IP range reserved for Cloud SQL instances and other Private Service Access services. Defaults to /16. | `number` | `16` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_service_networks"></a> [private\_service\_networks](#output\_private\_service\_networks) | List of the private services created. |
<!-- END_TF_DOCS -->