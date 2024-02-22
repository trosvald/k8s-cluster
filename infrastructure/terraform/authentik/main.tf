terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "monosense"
    workspaces {
      name = "authentik"
    }
  }

  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "2024.2.0"
    }
  }
}

module "secret_authentik" {
  # Remember to export OP_CONNECT_HOST and OP_CONNECT_TOKEN
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Automation"
  item   = "authentik"
}

module "secret_immich" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Automation"
  item   = "immich"
}

module "secret_grafana" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Automation"
  item   = "grafana"
}

module "secret_weave" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Automation"
  item   = "weave-gitops"
}

module "secret_pgadmin" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Automation"
  item   = "pgadmin"
}

module "secret_outline" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Automation"
  item   = "outline"
}

# module "secret_nextcloud" {
#   source = "github.com/bjw-s/terraform-1password-item?ref=main"
#   vault  = "Automation"
#   item   = "nextcloud"
# }


provider "authentik" {
  url   = module.secret_authentik.fields["endpoint_url"]
  token = module.secret_authentik.fields["api_token"]
}
