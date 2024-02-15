resource "minio_s3_bucket" "gitlab-tmp-backup" {
  bucket = "gitlab-tmp-backup"
  acl    = "public"
}
