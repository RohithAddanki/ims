provider "github" {
  token = var.github_token
}

resource "github_repository" "example_repo" {
  name        = "ims"
  description = "This repository was created using Terraform"
  visibility  = "private"

  has_issues   = true
  has_projects = true
  has_wiki     = true
}