# Terraform Project Log Sink

This module allows you to create project log sink

## Compatibility

This module is meant for use with Terraform 0.12. If you haven't [upgraded](https://www.terraform.io/upgrade-guides/0-12.html) and need a Terraform 0.11.x-compatible version of this module, the last released version intended for Terraform 0.11.x is [2.3.0](https://registry.terraform.io/modules/terraform-google-modules/log-export/google/2.3.0).

## Usage

The [examples](./examples) directory contains directories for each destination, and within each destination directory are directories for each parent resource level. Consider the following
example that will configure a Cloud Storage destination and a log export at the project level:

```hcl
module "project_log_sink" {
  source = "git::github.com/VUEcommerce/shopform-data-modules/gcp//project-sink"

  project_code = local.project
  environment  = local.env
  region       = local.region
  
  names = ["name1", "name2"]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| filter | The filter to apply when exporting logs. Only log entries that match the filter are exported. Default is '' which exports all logs. | `string` | `""` | no |
| names                    | The name of the log sinks to be created. | `list(string)` | n/a | yes |
| unique\_writer\_identity | Whether or not to create a unique identity associated with this sink. If false (the default), then the writer\_identity used is serviceAccount:cloud-logs@system.gserviceaccount.com. If true, then a unique service account is created and used for the logging sink. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| filters | The filter to be applied when exporting logs. |
| destinations | The destinations of the logs for storage bucket |
| names        | The name of the log sinks that were created. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements
### Terraform plugins
- [Terraform](https://www.terraform.io/downloads.html) 0.12.x
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin ~> v3.5.x

### Configure a Service Account
In order to execute this module you must have a Service Account with the following:

#### Roles
The service account should have the following roles:
- `roles/logging.configWriter` on the logsink's project, folder, or organization (to create the logsink)
- `roles/resourcemanager.projectIamAdmin` on the destination project (to grant write permissions for logsink service account)
- `roles/serviceusage.serviceUsageAdmin` on the destination project (to enable destination APIs)

#### Storage role
To use a Google Cloud Storage bucket as the destination:
- `roles/storage.admin` on the destination project (to create a storage bucket)



### Enable API's
In order to operate with the Service Account you must activate the following API's on the base project where the Service Account was created:

- Cloud Resource Manager API - cloudresourcemanager.googleapis.com
- Cloud Billing API - cloudbilling.googleapis.com
- Identity and Access Management API - iam.googleapis.com
- Service Usage API - serviceusage.googleapis.com
- Stackdriver Logging API - logging.googleapis.com
- Cloud Storage JSON API - storage-api.googleapis.com

## Install

### Terraform
Be sure you have the correct Terraform version (0.12.x), you can choose the binary here:

- https://releases.hashicorp.com/terraform/