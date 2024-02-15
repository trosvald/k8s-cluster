module "s3_gitlab-backup" {
  source      = "./modules/minio"
  vault       = "Automation"
  bucket_name = "gitlab-backup"
  # The OP provider converts the fields with toLower!
  user_secret_item = "gitlab_backup_s3_secret_key"
}
