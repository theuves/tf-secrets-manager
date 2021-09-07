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
```

**NOTE:** We recomend replace the `ref=master` argument by a specific version, example: `?ref=v1.0.0` ([see all releases here](https://github.com/theuves/tf-secrets-manager/releases)).
