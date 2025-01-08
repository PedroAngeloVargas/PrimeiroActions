resource "aws_s3_bucket" "bucket" {
  bucket = "bucket-pedrovargas-teste"
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "bucket" {
  depends_on = [
    aws_s3_bucket_public_access_block.bucket,
  ]

  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "html_file1" {
  bucket       = aws_s3_bucket.bucket.bucket
  key          = "index.html"
  source       = "./index.html"
  acl          = "public-read"
  content_type = "text/html"

}

resource "aws_s3_object" "html_file2" {
  bucket       = aws_s3_bucket.bucket.bucket
  key          = "services.html"
  source       = "./services.html"
  acl          = "public-read"
  content_type = "text/html"

}

resource "aws_s3_object" "html_file3" {
  bucket       = aws_s3_bucket.bucket.bucket
  key          = "contact.html"
  source       = "./contact.html"
  acl          = "public-read"
  content_type = "text/html"

}

resource "aws_s3_object" "html_file114" {
  bucket       = aws_s3_bucket.bucket.bucket
  key          = "styles.css"
  source       = "./styles.css"
  acl          = "public-read"
  content_type = "style/css"

}