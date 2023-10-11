terraform {
  backend "s3" {
    bucket = "bucket-new-my"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}