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
    "terragrunt-aws-organization" = {
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
    "terragrunt-aws-sandbox" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "terragrunt-hclfmt / lint",
        "terraform-fmt / lint",
      ]
    },
    "ansible-roles" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "ansible-playbooks" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "dotfiles" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "github-actions" = {
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
    "packer-aws" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "vagrant-virtualbox" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "vagrant-validate / lint",
      ]
    },
    "network-labs" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "go-simple-blockchain" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "simple-static-website" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
  }
}

module "repository" {
  source = "github.com/mateusz-uminski/terraform-service-modules//github-repository?ref=github-repository-v0.2.0"

  for_each = local.repositories

  name = each.key

  visibility = each.value.visibility
  license    = each.value.license

  protected_branch       = each.value.protected_branch
  required_status_checks = each.value.required_status_checks
}
