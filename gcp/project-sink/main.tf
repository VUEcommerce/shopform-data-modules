#-----------------#
# Local variables #
#-----------------#
locals {
  # For multi sinks
  names_set  = toset(var.names)
  sinks_list = [for name in var.names : google_logging_project_sink.sinks[name]]

  env     = var.environment
  project = var.project_code
  region  = var.region
}


#-----------#
# Log sinks #
#-----------#
resource "google_logging_project_sink" "sinks" {
  for_each = local.names_set

  name    = "${lower(each.value)}-sink"
  project = local.project

  filter      = "logName=projects/${local.project}/logs/${lower(each.value)}-${local.env}"
  destination = "storage.googleapis.com/${local.env}-${local.region}-${lower(each.value)}"

  unique_writer_identity = var.unique_writer_identity
}