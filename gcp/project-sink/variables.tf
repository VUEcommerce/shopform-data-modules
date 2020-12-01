variable "filter" {
  description = "The filter to apply when exporting logs. Only log entries that match the filter are exported. Default is '' which exports all logs."
  type        = string
  default     = ""
}

variable "names" {
  description = "The name of the log sinks to be created."
  type        = list(string)
}

variable "unique_writer_identity" {
  description = "Whether or not to create a unique identity associated with this sink. If false (the default), then the writer_identity used is serviceAccount:cloud-logs@system.gserviceaccount.com. If true, then a unique service account is created and used for the logging sink."
  type        = bool
  default     = false
}

###########################
# Project Variables
###########################

variable "project_code" {
  description = "The project code for project."
}

variable "environment" {
  description = "The environment for project. Available types: dev, qa, stg, val, prod."
}

variable "region" {
  description = "Region for resource"
}