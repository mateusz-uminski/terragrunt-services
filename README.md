# terragrunt-services

[![verify](https://github.com/mateusz-uminski/terragrunt-services/actions/workflows/verify.yaml/badge.svg)](https://github.com/mateusz-uminski/terragrunt-services/actions/workflows/verify.yaml)

This terragrunt code configures services that I use in my test environment to learn new things and verify crazy ideas. Besides the README.md further documentation can be found in commits, code comments and nested README files.
<br><br>
Feel free to explore and copy everything you want.
Enjoy!
<br><br>
Terragrunt uses terraform modules from this repository: [terraform-service-modules](https://github.com/mateusz-uminski/terraform-service-modules)


# Requirements
1. Terraform version ~> 1.3.3
2. Terragrunt version ~> 0.39.2
3. An AWS Account


# Prerequisites
0. Create `config.yaml` file in the project's root directory according to the `example-config.yaml`.
1. Get AWS profiles from `service.hcl` files.
1. Update your `~/.aws/credentials` and `~/.aws/config` files.


# Project structure
The repository has the following structure:
```
|
| service-name/
| | project-name/
| | | stack-name/
| | | | - terragrunt.hcl
| | | | - main.tf
| | | - project.hcl
| | - service.hcl
...
```
