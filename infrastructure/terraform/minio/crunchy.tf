module "s3_crunchy" {
  source      = "./modules/minio"
  vault       = "Automation"
  bucket_name = "crunchydata"
  # The OP provider converts the fields with toLower!
  user_secret_item = "crunchy_s3_secret_key"
}
