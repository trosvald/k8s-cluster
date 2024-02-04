terraform {
  cloud {
    organization = "monosense"

    workspaces {
      name = "s3"
    }
  }

  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = "2.0.1"
    }
  }
}

module "onepassword_item_minio" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Automation"
  item   = "minio"
}

provider "minio" {
  minio_server   = "s3.monosense.io:9000"
  minio_user     = module.onepassword_item_minio.fields.minio_user
  minio_password = module.onepassword_item_minio.fields.minio_password
  minio_region   = "dpk-ptr-tcore-1"
  minio_ssl      = true
}
