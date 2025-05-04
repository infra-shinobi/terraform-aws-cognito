# Terraform AWS Cognito Module

[![License: MPL 2.0](https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)

This Terraform module provides a comprehensive, flexible, and production-ready implementation of [AWS Cognito](https://aws.amazon.com/cognito/). It aims to simplify user pool and identity pool setup with a single unified interface, addressing gaps found in other Cognito modules by offering extended configuration and control over almost all Cognito features.

## Prerequisites and Providers

| Description   | Name      | Version     |
|---------------|-----------|-------------|
| Prerequisite  | Terraform | `>= 1.6.6`  |
| Provider      | aws       | `>= 5.31.0` |


## Why This Module?

While several Terraform modules for AWS Cognito exist, many are either overly opinionated, too limited in scope, or lack important customization options. This module is built from the ground up to support:

- Full control over **User Pools**, **Identity Pools**, and **App Clients**
- Fine-grained configuration for **Lambda triggers**, **MFA**, **email verification**, and **domain settings**
- Support for all optional features like **user pool groups**, **resource servers**, **identity providers**, and **IAM roles**
- Aimed at **production use-cases** with security, customization, and clarity in mind
- Clean outputs and structured inputs
- Follows Terraform best practices for readability and reusability


## Usage

```hcl
module "cognito" {
  source = "git::https://github.com/your-username/terraform-aws-cognito.git?ref=v1.0.0"

  # Example inputs
  name = "my-app"

  user_pool_config = {
    mfa_configuration = "ON"
    lambda_config = {
      pre_sign_up = aws_lambda_function.pre_sign_up.arn
    }
  }

  app_clients = [
    {
      name                         = "web-client"
      generate_secret              = false
      prevent_user_existence_errors = "ENABLED"
    }
  ]

  identity_pool_config = {
    allow_unauthenticated_identities = false
  }
}
```

## Inputs and Outputs

Please refer to the [docs/inputs.md](./docs/inputs.md) and [docs/outputs.md](./docs/outputs.md) files for a detailed explanation of all module inputs and outputs.


## Contributing

Contributions, issues, and feature requests are welcome! Here’s how you can help:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/my-feature`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/my-feature`).
5. Open a pull request.

Please make sure to update tests as appropriate and follow Terraform module structure and best practices.

## Authors

Module maintained by [infra-shinobi](https://github.com/infra-shinobi).

## Acknowledgements

- [Terraform AWS Provider](https://github.com/hashicorp/terraform-provider-aws)
- Inspiration taken from [Clouddrove's Terraform AWS Cognito module](https://github.com/clouddrove/terraform-aws-cognito)