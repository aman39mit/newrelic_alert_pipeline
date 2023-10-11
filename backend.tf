terraform {
  backend "s3" {
    bucket = "bucket-type"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}