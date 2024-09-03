terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = ">= 0.14.9"
}
resource "aws_s3_bucket" "terraform_challenge-state_bucket" {
  bucket = "terraform-challenge-state-bucket-3344"
}