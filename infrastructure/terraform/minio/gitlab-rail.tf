module "s3_gitlab-rail" {
  source      = "./modules/minio"
  vault       = "Automation"
  bucket_name = "gitlab-rail"
  # The OP provider converts the fields with toLower!
  user_secret_item = "gitlab_rail_s3_secret_key"
}
