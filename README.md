# tf-secrets-manager

[![Terraform](https://github.com/theuves/tf-secrets-manager/actions/workflows/terraform.yml/badge.svg)](https://github.com/theuves/tf-secrets-manager/actions/workflows/terraform.yml)
[![License](https://img.shields.io/github/license/theuves/tf-secrets-manager)](https://github.com/theuves/tf-secrets-manager/blob/master/LICENSE)

Terraform module to extract secrets from [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/).

## Terraform module

You can get the data from a secret using the following syntax:

```terraform
module "secrets_prod" {
  source      = "github.com/theuves/tf-secrets-manager.git?ref=master"
  secret_name = "my/secrets/prod"
}

# Retrieve the secrets with `module.secrets_prod.<output_name>`.
```

**NOTE:** We recomend replace the `ref=master` argument by a specific version, example: `?ref=v1.0.0` ([see all releases here](https://github.com/theuves/tf-secrets-manager/releases)).

## Input variables

| Name | Description | Type | Default value |
|:---|:---|:---|:---|
| `secret_name` | Secret name. | `string` | n/a |

## Output values

| Name | Description | Type | Sensitive |
|:---|:---|:---|:---|
| `taskdef_secret` | AWS ECS Task Definition secret (valueFrom). | `list(map)` | `false` |
| `taskdef_environment` | AWS ECS Task Definition environment (value). | `list(map)` | `true` |
| `dotenv` | Dotenv format (key-value pairs). | `string` | `true` |
| `linux` | Linux format. | `string` | `true` |

### Examples

If you have a secret called `mydb` with the following data:

| Name | Value |
|:---|:---|
| `DB_HOST` | `mydb.com` |
| `DB_USER` | `user` |
| `DB_PASS` | `pass` |

#### `taskdef_secret`

> AWS ECS Task Definition secret (valueFrom).

```hcl
[
  {
    name = "DB_HOST"
    valueFrom = "arn:aws:secretsmanager:<region>:<account_id>:secret:mydb-<version>:DB_HOST::"
  },
  {
    name = "DB_USER"
    valueFrom = "arn:aws:secretsmanager:<region>:<account_id>:secret:mydb-<version>:DB_USER::"
  },
  {
    name = "DB_PASS"
    valueFrom = "arn:aws:secretsmanager:<region>:<account_id>:secret:mydb-<version>:DB_PASS::"
  }
]
```

#### `taskdef_environment`

> AWS ECS Task Definition environment (value).

```hcl
[
  {
    name = "DB_HOST"
    value = "mydb.com"
  },
  {
    name = "DB_USER"
    value = "user"
  },
  {
    name = "DB_PASS"
    value = "pass"
  }
]
```

#### `dotenv`

> Dotenv format (key-value pairs).

```hcl
"DB_HOST='mydb.com'
DB_USER='user'
DB_PASS='pass'"
```

#### `linux`

> Linux format.

```hcl
"export DB_HOST='mydb.com'
export DB_USER='user'
export DB_PASS='pass'"
```

## License

MIT &copy; Matheus Alves
