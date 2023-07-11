resource "aws_s3_bucket" "first-bucket" {
  bucket = "curso-terraform-pcamposaugusto"

  versioning {
    enabled = true
  }
}