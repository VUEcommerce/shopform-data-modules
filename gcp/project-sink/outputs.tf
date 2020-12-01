output "log_sink_names" {
  description = "The name of the log sinks that were created."
  value = { for name, sink in google_logging_project_sink.sinks :
    name => sink.name
  }
}

output "log_sink_filters" {
  description = "The filter of the log sinks that were created."
  value = { for filter, sink in google_logging_project_sink.sinks :
    filter => sink.filter
  }
}

output "log_sink_destination" {
  description = "The destination of the log sinks that were created."
  value = { for destination, sink in google_logging_project_sink.sinks :
    name => sink.destination
  }
}