terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = ">= 3.0.0"
    }
  }
}

provider "gitlab" {
  token    = "glpat-Ma2agPU6XHxGuar-m9Yy"
  base_url = "http://localhost"
}

resource "gitlab_project" "example" {
  name             = "example-project"
  description      = "An example project managed by Terraform"
  visibility_level = "private"
}

# resource "gitlab_project" "root" {
#   name        = "micro-service"
#   description = "test"

#   visibility_level = "public"
# }

resource "gitlab_user" "example_user" {
  name               = "Ahmad"
  username           = "Ahmad"
  email              = "exampleuser@example.com"
  password           = "strongpassword"
  is_admin           = true
  skip_confirmation  = true
}

resource "gitlab_project_membership" "test" {
  project   = "micro-service"
  user_id      = gitlab_user.example_user.id
  access_level = "developer"
}

resource "gitlab_pipeline_trigger" "example_trigger" {
  project = gitlab_project.root.id
  description = "Pipeline trigger for example project"
}
