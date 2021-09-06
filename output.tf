output "taskdef-secret" {
  value = [for key in keys(local.secrets) : {
    name      = key
    valueFrom = "${data.aws_secretsmanager_secret.main.id}:${key}::"
  }]
  description = "AWS ECS Task Definition secret (valueFrom)."
  sensitive   = var.sensitive
}

output "taskdef-environment" {
  value = [for key in keys(local.secrets) : {
    name  = key
    value = local.secrets[key]
  }]
  description = "AWS ECS Task Definition environment (value)."
  sensitive   = var.sensitive
}

output "dotenv" {
  value       = join("\n", [for key in keys(local.secrets) : "${key}='${local.secrets[key]}'"])
  description = "Dotenv format (key-value pairs)."
  sensitive   = var.sensitive
}

output "linux" {
  value       = join("\n", [for key in keys(local.secrets) : "export ${key}='${local.secrets[key]}'"])
  description = "Linux format."
  sensitive   = var.sensitive
}

output "cmd" {
  value       = join("\n", [for key in keys(local.secrets) : "set ${key}='${local.secrets[key]}'"])
  description = "Windows Command Prompt (cmd.exe)."
  sensitive   = var.sensitive
}