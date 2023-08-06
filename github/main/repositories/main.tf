locals {
  repositories = {
    "terragrunt-services" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "terragrunt-hclfmt / lint",
        "terraform-fmt / lint",
      ]
    },
    "terraform-service-modules" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "terraform-fmt / lint",
      ]
    },
    "terragrunt-aws-infrastructures" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "terragrunt-hclfmt / lint",
        "terraform-fmt / lint",
      ]
    },
    "terraform-aws-modules" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "terraform-fmt / lint",
      ]
    },
    "terragrunt-labs" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "terragrunt-hclfmt / lint",
        "terraform-fmt / lint",
      ]
    },
    "dotfiles" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "github-actions-shared-workflows" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "pre-commit-hooks" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "dockerfiles" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
  }
}

module "repository" {
  source = "git::https://github.com/mateusz-uminski/terraform-service-modules//github-repository?ref=github-repository/v0.1.0"

  for_each = local.repositories

  name = each.key

  visibility = each.value.visibility
  license    = each.value.license

  protected_branch       = each.value.protected_branch
  required_status_checks = each.value.required_status_checks
}
