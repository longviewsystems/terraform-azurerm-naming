# Overview
This module helps apply a naming convention to your IaC Terraform code by generating a list of resource names by type.  It supports the following naming components:
* ResourceType
* Org
* UnitDept
* ProjAppSvc
* Environment
* Location
* Instance

Features:
* Generates a list of resource names by type (e.g. Virtual Wan name vwan-rog-mtx-dev-wu-01)
* Each naming component is optional and can be specified in any order. (e.g. mtx-vwan-rog-dev-wu-01 or vwan-rog-mtx-dev-wu-01)
* Names are output for use in larger Terraform projects.
* Names are truncated based on the length the Resource Type supports.
* Names are validated against allowed Azure naming values.
* Resources that do not support special characters like hyphens have them removed (e.g. Azure Storage Account names).

These name components align with the (Azure Naming Tool)[https://github.com/microsoft/CloudAdoptionFramework/tree/master/ready/AzNamingTool] which is part of the Azure CLoud Adoption Framework list of (tools)[https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/resources/tools-templates].  The Azure Naming Tool is very useful for generating full naming conventions.

A sample (Azure Naming Tool)[https://github.com/microsoft/CloudAdoptionFramework/tree/master/ready/AzNamingTool] is in ./AzNamingTool. 

# Limitations
* Certain Resource types (e.g. Virtual Machines) support very short names, and the naming convention will be truncated to the length of the Resource Type.  This may remove naming components that are important.
* Multiple instances should be produced by running the module in a for loop.
* Maintaining the list of resources is challenging and requires a lot of manual work.  In some cases the names produced by this module may not match the (Azure Naming Tool)[https://github.com/microsoft/CloudAdoptionFramework/tree/master/ready/AzNamingTool].  Names should be double checked.

# Usage

## Sample #1
Name componets are specified in the order below, along with sample replacement values.

```
module "sample_one" {
  source = "../../"
  name_components = ["ResourceType", "Org", "ProjAppSvc", "Environment", "Location", "Instance"]
  environment = "dev"
  organization = "rog"
  location = "wu"
  proj_app_or_svc = "mtx"
  unit_or_dept = "fin"
  instance = "01"
}
```

Sample names:
* app_service     = "app-rog-mtx-dev-wu-01"
* storage_account = "strogmtxdevwu01" 
* subnet          = "snet-rog-mtx-dev-wu-01"
* virtual_network = "vnet-rog-mtx-dev-wu-01" 

## Sample #2

  ```
  module "test_two" {
    source = "../../"
    name_components = ["ResourceType", "ProjAppSvc", "Environment", "UnitDept", "Location", "Instance"]
    environment = "prd"
    #organization = "rog"
    location = "cc"
    proj_app_or_svc = "svt"
    unit_or_dept = "acc"
    instance = "02"
  }
  ```

  Sample names:
  * app_service = "app-svt-prd-acc-cc-02"
  * storage_account = "stsvtprdacccc02"
  * subnet = "snet-svt-prd-acc-cc-02"
  * virtual_network = "vnet-svt-prd-acc-cc-02"

------------


## Output

Each one of the resources emits the name of the resource and other properties:

| Property | Type | Description |
| ----- |----- | ---- |
| name | string | name of the resource including respective suffixes and prefixes applied |
| name_unique | string | same as the name but with random chars added for uniqueness |
| dashes | bool | if these resources support dashes |
| slug | string | letters to identify this resource among others |
| min_length | integer | Minimum length required for this resource name |
| max_length | integer | Maximum length allowed for this resource name |
| scope | string | scope which this name needs to be unique, such as `resourcegroup` or `global`  |
| regex | string | Terraform compatible version of the regex |


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.99 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | 0.1.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The value to replace the 'Environment' name components with. | `string` | `"dev"` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | The value to replace the 'Instance' name components | `string` | `"01"` | no |
| <a name="input_location"></a> [location](#input\_location) | The value to replace the 'Location' name components with. | `string` | `"wu"` | no |
| <a name="input_name_components"></a> [name\_components](#input\_name\_components) | The components of the names.  Each compoent will be replaced with a value from one of the variables.  See the readme for further details. | `list(string)` | <pre>[<br>  "ResourceType",<br>  "Org",<br>  "ProjAppSvc",<br>  "Environment",<br>  "Location",<br>  "Instance"<br>]</pre> | no |
| <a name="input_organization"></a> [organization](#input\_organization) | The value to replace the 'Org' name components with. | `string` | `"rog"` | no |
| <a name="input_proj_app_or_svc"></a> [proj\_app\_or\_svc](#input\_proj\_app\_or\_svc) | The value to replace the 'ProjAppSvc' name components | `string` | `"mtx"` | no |
| <a name="input_unique_include_numbers"></a> [unique\_include\_numbers](#input\_unique\_include\_numbers) | Include numbers in the random string | `bool` | `false` | no |
| <a name="input_unique_length"></a> [unique\_length](#input\_unique\_length) | The length of the random string | `number` | `4` | no |
| <a name="input_unique_seed"></a> [unique\_seed](#input\_unique\_seed) | The seed for the random generator | `string` | `"random"` | no |
| <a name="input_unit_or_dept"></a> [unit\_or\_dept](#input\_unit\_or\_dept) | The value to replace the 'UnitDept' name components | `string` | `"fin"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_names"></a> [names](#output\_names) | A map of resources of all the supported resources. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Supported Types

| Name | Description |
|------|-------------|
| analysis\_services\_server | n/a |
| api\_management | n/a |
| app\_configuration | n/a |
| app\_service | n/a |
| app\_service\_plan | n/a |
| application\_insights | n/a |
| application\_gateway | n/a |
| application\_security\_group | n/a |
| automation\_account | n/a |
| automation\_certificate | n/a |
| automation\_credential | n/a |
| automation\_runbook | n/a |
| automation\_schedule | n/a |
| automation\_variable | n/a |
| availability\_set | n/a |
| bastion\_host | n/a |
| batch\_account | n/a |
| batch\_application | n/a |
| batch\_certificate | n/a |
| batch\_pool | n/a |
| bot\_channel\_email | n/a |
| bot\_channel\_directline | n/a |
| bot\_channel\_ms\_teams | n/a |
| bot\_channel\_slack | n/a |
| bot\_channels\_registration | n/a |
| bot\_connection | n/a |
| bot\_web\_app | n/a |
| cdn\_endpoint | n/a |
| cdn\_profile | n/a |
| cognitive\_account | n/a |
| container\_group | n/a |
| container\_registry | n/a |
| container\_registry\_webhook | n/a |
| cosmosdb\_account | n/a |
| custom\_provider | n/a |
| dashboard | n/a |
| data\_factory | n/a |
| data\_factory\_dataset\_mysql | n/a |
| data\_factory\_dataset\_postgresql | n/a |
| data\_factory\_dataset\_sql\_server\_table | n/a |
| data\_factory\_integration\_runtime\_managed | n/a |
| data\_factory\_linked\_service\_data\_lake\_storage\_gen2 | n/a |
| data\_factory\_linked\_service\_key\_vault | n/a |
| data\_factory\_linked\_service\_mysql | n/a |
| data\_factory\_linked\_service\_postgresql | n/a |
| data\_factory\_linked\_service\_sql\_server | n/a |
| data\_factory\_pipeline | n/a |
| data\_factory\_trigger\_schedule | n/a |
| data\_lake\_analytics\_account | n/a |
| data\_lake\_analytics\_firewall\_rule | n/a |
| data\_lake\_store | n/a |
| data\_lake\_store\_firewall\_rule | n/a |
| database\_migration\_project | n/a |
| database\_migration\_service | n/a |
| databricks\_cluster | n/a |
| databricks\_high\_concurrency\_cluster | n/a |
| databricks\_standard\_cluster | n/a |
| databricks\_workspace | n/a |
| dev\_test\_lab | n/a |
| dev\_test\_linux\_virtual\_machine | n/a |
| dev\_test\_windows\_virtual\_machine | n/a |
| disk\_encryption\_set | n/a |
| dns\_a\_record | n/a |
| dns\_aaaa\_record | n/a |
| dns\_caa\_record | n/a |
| dns\_cname\_record | n/a |
| dns\_mx\_record | n/a |
| dns\_ns\_record | n/a |
| dns\_ptr\_record | n/a |
| dns\_txt\_record | n/a |
| dns\_zone | n/a |
| eventgrid\_domain | n/a |
| eventgrid\_domain\_topic | n/a |
| eventgrid\_event\_subscription | n/a |
| eventgrid\_topic | n/a |
| eventhub | n/a |
| eventhub\_authorization\_rule | n/a |
| eventhub\_consumer\_group | n/a |
| eventhub\_namespace | n/a |
| eventhub\_namespace\_authorization\_rule | n/a |
| eventhub\_namespace\_disaster\_recovery\_config | n/a |
| express\_route\_circuit | n/a |
| express\_route\_gateway | n/a |
| firewall | n/a |
| firewall\_application\_rule\_collection | n/a |
| firewall\_ip\_configuration | n/a |
| firewall\_nat\_rule\_collection | n/a |
| firewall\_network\_rule\_collection | n/a |
| frontdoor | n/a |
| frontdoor\_firewall\_policy | n/a |
| function\_app | n/a |
| hdinsight\_hadoop\_cluster | n/a |
| hdinsight\_hbase\_cluster | n/a |
| hdinsight\_interactive\_query\_cluster | n/a |
| hdinsight\_kafka\_cluster | n/a |
| hdinsight\_ml\_services\_cluster | n/a |
| hdinsight\_rserver\_cluster | n/a |
| hdinsight\_spark\_cluster | n/a |
| hdinsight\_storm\_cluster | n/a |
| image | n/a |
| iotcentral\_application | n/a |
| iothub | n/a |
| iothub\_consumer\_group | n/a |
| iothub\_dps | n/a |
| iothub\_dps\_certificate | n/a |
| key\_vault | n/a |
| key\_vault\_certificate | n/a |
| key\_vault\_key | n/a |
| key\_vault\_secret | n/a |
| kubernetes\_cluster | n/a |
| kusto\_cluster | n/a |
| kusto\_database | n/a |
| kusto\_eventhub\_data\_connection | n/a |
| lb | n/a |
| lb\_nat\_rule | n/a |
| linux\_virtual\_machine | n/a |
| linux\_virtual\_machine\_scale\_set | n/a |
| local\_network\_gateway | n/a |
| log\_analytics\_workspace | n/a |
| machine\_learning\_workspace | n/a |
| managed\_disk | n/a |
| maps\_account | n/a |
| mariadb\_database | n/a |
| mariadb\_firewall\_rule | n/a |
| mariadb\_server | n/a |
| mariadb\_virtual\_network\_rule | n/a |
| mssql\_database | n/a |
| mssql\_elasticpool | n/a |
| mssql\_server | n/a |
| mysql\_database | n/a |
| mysql\_firewall\_rule | n/a |
| mysql\_server | n/a |
| mysql\_virtual\_network\_rule | n/a |
| network\_ddos\_protection\_plan | n/a |
| network\_interface | n/a |
| network\_security\_group | n/a |
| network\_security\_group\_rule | n/a |
| network\_security\_rule | n/a |
| network\_watcher | n/a |
| notification\_hub | n/a |
| notification\_hub\_authorization\_rule | n/a |
| notification\_hub\_namespace | n/a |
| point\_to\_site\_vpn\_gateway | n/a |
| postgresql\_database | n/a |
| postgresql\_firewall\_rule | n/a |
| postgresql\_server | n/a |
| postgresql\_virtual\_network\_rule | n/a |
| powerbi\_embedded | n/a |
| private\_dns\_a\_record | n/a |
| private\_dns\_aaaa\_record | n/a |
| private\_dns\_cname\_record | n/a |
| private\_dns\_mx\_record | n/a |
| private\_dns\_ptr\_record | n/a |
| private\_dns\_srv\_record | n/a |
| private\_dns\_txt\_record | n/a |
| private\_dns\_zone | n/a |
| private\_dns\_zone\_group | n/a |
| private\_endpoint | n/a |
| private\_link\_service | n/a |
| private\_service\_connection | n/a |
| proximity\_placement\_group | n/a |
| public\_ip | n/a |
| public\_ip\_prefix | n/a |
| redis\_cache | n/a |
| redis\_firewall\_rule | n/a |
| relay\_hybrid\_connection | n/a |
| relay\_namespace | n/a |
| resource\_group | n/a |
| role\_assignment | n/a |
| role\_definition | n/a |
| route | n/a |
| route\_table | n/a |
| service\_fabric\_cluster | n/a |
| servicebus\_namespace | n/a |
| servicebus\_namespace\_authorization\_rule | n/a |
| servicebus\_queue | n/a |
| servicebus\_queue\_authorization\_rule | n/a |
| servicebus\_subscription | n/a |
| servicebus\_subscription\_rule | n/a |
| servicebus\_topic | n/a |
| servicebus\_topic\_authorization\_rule | n/a |
| shared\_image | n/a |
| shared\_image\_gallery | n/a |
| signalr\_service | n/a |
| snapshots | n/a |
| sql\_elasticpool | n/a |
| sql\_failover\_group | n/a |
| sql\_firewall\_rule | n/a |
| sql\_server | n/a |
| storage\_account | n/a |
| storage\_blob | n/a |
| storage\_container | n/a |
| storage\_data\_lake\_gen2\_filesystem | n/a |
| storage\_queue | n/a |
| storage\_share | n/a |
| storage\_share\_directory | n/a |
| storage\_table | n/a |
| stream\_analytics\_function\_javascript\_udf | n/a |
| stream\_analytics\_job | n/a |
| stream\_analytics\_output\_blob | n/a |
| stream\_analytics\_output\_eventhub | n/a |
| stream\_analytics\_output\_mssql | n/a |
| stream\_analytics\_output\_servicebus\_queue | n/a |
| stream\_analytics\_output\_servicebus\_topic | n/a |
| stream\_analytics\_reference\_input\_blob | n/a |
| stream\_analytics\_stream\_input\_blob | n/a |
| stream\_analytics\_stream\_input\_eventhub | n/a |
| stream\_analytics\_stream\_input\_iothub | n/a |
| subnet | n/a |
| template\_deployment | n/a |
| traffic\_manager\_profile | n/a |
| unique-seed | n/a |
| user\_assigned\_identity | n/a |
| validation | n/a |
| virtual\_machine | n/a |
| virtual\_machine\_extension | n/a |
| virtual\_machine\_scale\_set | n/a |
| virtual\_machine\_scale\_set\_extension | n/a |
| virtual\_network | n/a |
| virtual\_network\_gateway | n/a |
| virtual\_network\_peering | n/a |
| virtual\_wan | n/a |
| windows\_virtual\_machine | n/a |
| windows\_virtual\_machine\_scale\_set | n/a |
