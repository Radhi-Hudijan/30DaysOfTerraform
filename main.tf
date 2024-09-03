terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = ">= 0.14.9"
}
resource "aws_s3_bucket" "30DaysOfTerraform" {
  bucket = "30daysofterraform-3344"
}