terraform {
  backend "s3" {
    bucket = "30daysofterraform-3344"
    key    = "terraform.tfstate"
    region = var.region
  }
}