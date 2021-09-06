data "aws_secretsmanager_secret" "main" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "main" {
  secret_id = data.aws_secretsmanager_secret.main.id
}
