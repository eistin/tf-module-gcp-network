<!-- BEGIN_TF_DOCS -->
## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the VPC network to peer. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID of the VPC network to peer. This can be a shared VPC host projec. | `string` | n/a | yes |
| <a name="input_vpc_access_connectors"></a> [vpc\_access\_connectors](#input\_vpc\_access\_connectors) | n/a | <pre>list(object({<br>    name          = string<br>    ip_cidr_range = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_access_connectors"></a> [vpc\_access\_connectors](#output\_vpc\_access\_connectors) | List of the vpc access connectors. |
<!-- END_TF_DOCS -->