#
# Groups (Directory resources)
# https://registry.terraform.io/providers/goauthentik/authentik/latest/docs/resources/group
#
resource "authentik_group" "users" {
  name         = "users"
  is_superuser = false
}

resource "authentik_group" "media" {
  name         = "media"
  is_superuser = false
  parent       = resource.authentik_group.users.id
}

resource "authentik_group" "nextcloud" {
  name         = "nextcloud"
  is_superuser = false
  parent       = resource.authentik_group.users.id
  attributes = jsonencode({
    defaultQuota = "20 GB"
  })
}

resource "authentik_group" "infrastructure" {
  name         = "infrastructure"
  is_superuser = false
}

resource "authentik_group" "development" {
  name         = "development"
  is_superuser = false
}

resource "authentik_group" "database" {
  name         = "database"
  is_superuser = false
}

resource "authentik_group" "administrator" {
  name          = "administrator"
  is_superuser  = true
}
data "authentik_group" "admins" {
  name = "authentik Admins"
}

#
# Users (Directory resources)
# https://registry.terraform.io/providers/goauthentik/authentik/latest/docs/resources/user
#
resource "authentik_user" "monosense" {
  username  = "monosense"
  name      = "Eko Purwanto"
  email     = "eko.purwanto@monosense.io"
  groups    = [
    authentik_group.administrator.id,
    authentik_group.database.id,
    authentik_group.development.id,
    authentik_group.infrastructure.id,
    authentik_group.media.id,
    authentik_group.users.id
  ]
}
