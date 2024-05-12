<!-- BEGIN_TF_DOCS -->
## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the targeted network | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project where the routes will be created | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The ID of the project where the routes will be created | `string` | n/a | yes |
| <a name="input_log_config_enable"></a> [log\_config\_enable](#input\_log\_config\_enable) | Indicates whether or not to export logs. | `bool` | `false` | no |
| <a name="input_log_config_filter"></a> [log\_config\_filter](#input\_log\_config\_filter) | Specifies the desired filtering of logs on this NAT. Possible values are ERRORS\_ONLY, TRANSLATIONS\_ONLY, and ALL | `string` | `"ERRORS_ONLY"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->