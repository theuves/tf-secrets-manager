output "taskdef_secret" {
  value = [for key in keys(local.secrets) : {
    name      = key
    valueFrom = "${data.aws_secretsmanager_secret.main.id}:${key}::"
  }]
  description = "AWS ECS Task Definition secret (valueFrom)."
  sensitive   = false
}

output "taskdef_environment" {
  value = [for key in keys(local.secrets) : {
    name  = key
    value = local.secrets[key]
  }]
  description = "AWS ECS Task Definition environment (value)."
  sensitive   = true
}

output "dotenv" {
  value       = join("\n", [for key in keys(local.secrets) : "${key}='${local.secrets[key]}'"])
  description = "Dotenv format (key-value pairs)."
  sensitive   = true
}

output "linux" {
  value       = join("\n", [for key in keys(local.secrets) : "export ${key}='${local.secrets[key]}'"])
  description = "Linux format."
  sensitive   = true
}
