terraform {
  backend "s3" {
    bucket = "terraform-challenge-state-bucket-3344"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}
