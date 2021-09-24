resource "aws_s3_bucket" "b" {
  bucket = "ynalbantdevopsbucket"
  acl    = "private"
}