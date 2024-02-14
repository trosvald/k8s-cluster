# OAuth2 Applications
module "oauth2-grafana" {
  source             = "./oauth2_application"
  name               = "Grafana"
  icon_url           = "https://raw.githubusercontent.com/grafana/grafana/main/public/img/icons/mono/grafana.svg"
  launch_url         = "https://grafana.${module.secret_authentik.fields["cluster_domain"]}"
  description        = "Infrastructure Monitoring"
  newtab             = true
  group              = "Infrastructure"
  auth_groups        = [authentik_group.infrastructure.id]
  authorization_flow = resource.authentik_flow.provider-authorization-implicit-consent.uuid
  client_id          = module.secret_grafana.fields["grafana_oidc_client_id"]
  client_secret      = module.secret_grafana.fields["grafana_oidc_client_secret"]
  redirect_uris      = ["https://grafana.${module.secret_authentik.fields["cluster_domain"]}/login/generic_oauth"]
}

module "oauth2-immich" {
  source             = "./oauth2_application"
  name               = "Immich"
  icon_url           = "https://github.com/immich-app/immich/raw/main/docs/static/img/favicon.png"
  launch_url         = "https://photos.${module.secret_authentik.fields["cluster_domain"]}"
  description        = "Photo management"
  newtab             = true
  group              = "Media"
  auth_groups        = [authentik_group.media.id]
  authorization_flow = resource.authentik_flow.provider-authorization-implicit-consent.uuid
  client_id          = module.secret_immich.fields["immich_oidc_client_id"]
  client_secret      = module.secret_immich.fields["immich_oidc_client_secret"]
  redirect_uris = [
    "https://photos.${module.secret_authentik.fields["cluster_domain"]}/auth/login",
    "app.immich:/"
  ]
}

module "oauth2-weave" {
  source              = "./oauth2_application"
  name                = "Weave"
  icon_url            = "https://raw.githubusercontent.com/weaveworks/weave-gitops/main/ui/images/WeaveLogo.svg"
  launch_url          = "https://gitops.${module.secret_authentik.fields["cluster_domain"]}"
  description         = "GitOps Dashboard"
  newtab              = true
  group               = "Infrastructure"
  auth_groups         = [authentik_group.infrastructure.id]
  authorization_flow  = resource.authentik_flow.provider-authorization-implicit-consent.uuid
  client_id           = module.secret_weave.fields["oidc_client_id"]
  client_secret       = module.secret_weave.fields["oidc_client_secret"]
  redirect_uris       = ["https://gitops.${module.secret_authentik.fields["cluster_domain"]}/oauth2/callback"]
}

module "oauth2-pgadmin" {
  source              = "./oauth2_application"
  name                = "PgAdmin"
  icon_url            = "https://raw.githubusercontent.com/pgadmin-org/pgadmin4/master/web/pgadmin/static/img/logo-right-256.png"
  launch_url          = "https://pgadmin.${module.secret_authentik.fields["cluster_domain"]}"
  description         = "PostgreSQL Management"
  newtab              = true
  group               = "Database"
  auth_groups         = [authentik_group.database.id]
  authorization_flow  = resource.authentik_flow.provider-authorization-implicit-consent.uuid
  client_id           = module.secret_pgadmin.fields["oidc_client_id"]
  client_secret       = module.secret_pgadmin.fields["oidc_client_secret"]
  redirect_uris       = ["https://pgadmin.${module.secret_authentik.fields["cluster_domain"]}/oauth2/authorize"]
}

module "oauth2-outline" {
  source              = "./oauth2_application"
  name                = "Outline"
  icon_url            = "https://www.getoutline.com/images/logo.svg"
  launch_url          = "https://docs.${module.secret_authentik.fields["cluster_domain"]}"
  description         = "Team Knowledge Base"
  newtab              = true
  group               = "Media"
  auth_groups         = [authentik_group.media.id]
  authorization_flow  = resource.authentik_flow.provider-authorization-implicit-consent.uuid
  client_id           = module.secret_outline.fields["oidc_client_id"]
  client_secret       = module.secret_outline.fields["oidc_client_secret"]
  redirect_uris       = ["https://docs.${module.secret_authentik.fields["cluster_domain"]}/auth/oidc.callback"]
}


# module "oauth2-weave" {
#   source              = "./oauth2_application"
#   name                = "Weave GitOps"
#   icon_url            = "https://raw.githubusercontent.com/weaveworks/weave-gitops/main/ui/images/WeaveLogo.svg"
#   launch_url          = "https://gitops.${module.secret_authentik.fields["cluster_domain"]}"
#   description         = "GitOps Dashboard"
#   newtab              = true
#   group               = "Development"
#   auth_groups         = [authentik_group.development.id]
#   authorization_flow  = resource.authentik_flow.provider-authorization-implicit-consent.uuid
#   client_id           = module.secret_weave.fields["oidc_client_id"]
#   client_secret       = module.secret_weave.fields["oidc_client_secret"]
#   redirect_uris       = ["https://gitops.${module.secret_authentik_fields["cluster_domain"]}/oauth2/callback"]
# }

# module "oauth2-audiobookshelf" {
#   source             = "./oauth2_application"
#   name               = "Audiobookshelf"
#   icon_url           = "https://raw.githubusercontent.com/advplyr/audiobookshelf-web/master/static/Logo.png"
#   launch_url         = "https://audiobooks.${module.secret_authentik.fields["cluster_domain"]}"
#   description        = "Media player"
#   newtab             = true
#   group              = "Media"
#   auth_groups        = [authentik_group.media.id]
#   authorization_flow = resource.authentik_flow.provider-authorization-implicit-consent.uuid
#   client_id          = module.secret_audiobookshelf.fields["OIDC_CLIENT_ID"]
#   client_secret      = module.secret_audiobookshelf.fields["OIDC_CLIENT_SECRET"]
#   redirect_uris      = ["https://audiobooks.${module.secret_authentik.fields["cluster_domain"]}/auth/openid/callback", "audiobookshelf://oauth"]
# }

# module "oauth2-nextcloud" {
#   source                       = "./oauth2_application"
#   name                         = "Nextcloud"
#   icon_url                     = "https://upload.wikimedia.org/wikipedia/commons/6/60/Nextcloud_Logo.svg"
#   launch_url                   = "https://files.${module.secret_authentik.fields["cluster_domain"]}"
#   description                  = "Files"
#   newtab                       = true
#   group                        = "Groupware"
#   auth_groups                  = [authentik_group.nextcloud.id]
#   authorization_flow           = resource.authentik_flow.provider-authorization-implicit-consent.uuid
#   client_id                    = module.secret_nextcloud.fields["OIDC_CLIENT_ID"]
#   client_secret                = module.secret_nextcloud.fields["OIDC_CLIENT_SECRET"]
#   include_claims_in_id_token   = false
#   additional_property_mappings = formatlist(authentik_scope_mapping.openid-nextcloud.id)
#   sub_mode                     = "user_username"
#   redirect_uris                = ["https://files.${module.secret_authentik.fields["cluster_domain"]}/apps/oidc_login/oidc"]
# }

## Proxy Application

module "proxy-echoserv" {
  source             = "./proxy_application"
  name               = "Echo Server"
  description        = "Test Services"
  icon_url           = "https://github.com/transmission/transmission/raw/main/web/assets/img/logo.png"
  group              = "Downloads"
  slug               = "echo-server"
  domain             = module.secret_authentik.fields["cluster_domain"]
  authorization_flow = resource.authentik_flow.provider-authorization-implicit-consent.uuid
  auth_groups        = [authentik_group.media.id]
}

# module "proxy-prowlarr" {
#   source             = "./proxy_application"
#   name               = "Prowlarr"
#   description        = "Torrent indexer"
#   icon_url           = "https://raw.githubusercontent.com/Prowlarr/Prowlarr/develop/Logo/128.png"
#   group              = "Downloads"
#   slug               = "indexer"
#   domain             = module.secret_authentik.fields["cluster_domain"]
#   authorization_flow = resource.authentik_flow.provider-authorization-implicit-consent.uuid
#   auth_groups        = [authentik_group.media.id]
# }

# module "proxy-radarr" {
#   source             = "./proxy_application"
#   name               = "Radarr"
#   description        = "Movies"
#   icon_url           = "https://github.com/Radarr/Radarr/raw/develop/Logo/128.png"
#   group              = "Downloads"
#   slug               = "movies"
#   domain             = module.secret_authentik.fields["cluster_domain"]
#   authorization_flow = resource.authentik_flow.provider-authorization-implicit-consent.uuid
#   auth_groups        = [authentik_group.media.id]
# }

# module "proxy-sonarr" {
#   source             = "./proxy_application"
#   name               = "Sonarr"
#   description        = "TV"
#   icon_url           = "https://github.com/Sonarr/Sonarr/raw/develop/Logo/128.png"
#   group              = "Downloads"
#   slug               = "tv"
#   domain             = module.secret_authentik.fields["cluster_domain"]
#   authorization_flow = resource.authentik_flow.provider-authorization-implicit-consent.uuid
#   auth_groups        = [authentik_group.media.id]
# }

# module "proxy-lidarr" {
#   source             = "./proxy_application"
#   name               = "Lidarr"
#   description        = "Music"
#   icon_url           = "https://github.com/Lidarr/Lidarr/raw/develop/Logo/128.png"
#   group              = "Downloads"
#   slug               = "music"
#   domain             = module.secret_authentik.fields["cluster_domain"]
#   authorization_flow = resource.authentik_flow.provider-authorization-implicit-consent.uuid
#   auth_groups        = [authentik_group.media.id]
# }

# module "proxy-bazarr" {
#   source             = "./proxy_application"
#   name               = "Bazarr"
#   description        = "Subtitles"
#   icon_url           = "https://github.com/morpheus65535/bazarr/raw/master/frontend/public/images/logo128.png"
#   group              = "Downloads"
#   slug               = "bazarr"
#   domain             = module.secret_authentik.fields["cluster_domain"]
#   authorization_flow = resource.authentik_flow.provider-authorization-implicit-consent.uuid
#   auth_groups        = [authentik_group.media.id]
# }

# module "proxy-readarr" {
#   source             = "./proxy_application"
#   name               = "Readarr"
#   description        = "Books"
#   icon_url           = "https://raw.githubusercontent.com/Readarr/Readarr/develop/Logo/128.png"
#   group              = "Downloads"
#   slug               = "readarr"
#   domain             = module.secret_authentik.fields["cluster_domain"]
#   authorization_flow = resource.authentik_flow.provider-authorization-implicit-consent.uuid
#   auth_groups        = [authentik_group.media.id]
# }

# module "proxy-navidrome" {
#   source             = "./proxy_application"
#   name               = "Navidrome"
#   description        = "Music player"
#   icon_url           = "https://github.com/navidrome/navidrome/raw/master/resources/logo-192x192.png"
#   group              = "Media"
#   slug               = "navidrome"
#   domain             = module.secret_authentik.fields["cluster_domain"]
#   authorization_flow = resource.authentik_flow.provider-authorization-implicit-consent.uuid
#   auth_groups        = [authentik_group.media.id]
#   ignore_paths       = <<-EOT
#   /rest/*
#   /share/*
#   EOT
# }

# module "proxy-homepage" {
#   source             = "./proxy_application"
#   name               = "Home"
#   description        = "Homepage"
#   icon_url           = "https://raw.githubusercontent.com/gethomepage/homepage/main/public/android-chrome-192x192.png"
#   group              = "Home"
#   slug               = "home"
#   domain             = module.secret_authentik.fields["cluster_domain"]
#   authorization_flow = resource.authentik_flow.provider-authorization-implicit-consent.uuid
#   auth_groups        = [authentik_group.users.id]
# }
