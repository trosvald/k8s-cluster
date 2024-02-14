module "s3_outline" {
  source      = "./modules/minio"
  vault       = "Automation"
  bucket_name = "outline"
  # The OP provider converts the fields with toLower!
  user_secret_item = "outline_s3_secret_key"
}
