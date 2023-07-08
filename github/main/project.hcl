locals {
  project = "main"

  config_vars  = yamldecode(file(find_in_parent_folders("config.yaml")))
  github_token = local.config_vars.main_github_token
}

generate "provider" {
  path      = "provider-gen.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    provider "github" {
      token = "${local.github_token}"
    }
  EOF
}
