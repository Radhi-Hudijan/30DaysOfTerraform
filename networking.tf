resource "aws_vpc" "my-30Days-aws-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-30Days-aws-vpc"
  }

  instance_tenancy = "default"

}
