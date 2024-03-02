locals {
  service_vars = read_terragrunt_config(find_in_parent_folders("service.hcl"))
  service_name = local.service_vars.locals.service_name
  aws_profile  = local.service_vars.locals.aws_profile

  project_vars = read_terragrunt_config(find_in_parent_folders("project.hcl"))
  project_name = local.project_vars.locals.project
}

inputs = merge(
  local.service_vars.locals,
  local.project_vars.locals,
)

terraform {
  extra_arguments "use_aws_profile" {
    commands = [
      "init",
      "apply",
      "refresh",
      "import",
      "plan",
      "taint",
      "untaint",
    ]

    env_vars = {
      AWS_PROFILE = local.aws_profile
    }
  }
}

remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "${local.service_name}-terragrunt-terraform-states"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    profile        = local.aws_profile
    region         = "us-east-1"
    dynamodb_table = "${local.service_name}-terraform-locks"
  }
  generate = {
    path      = "backend-gen.tf"
    if_exists = "overwrite_terragrunt"
  }
}

generate = local.project_vars.generate
