resource "aws_vpc" "my-30Days-aws-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-30Days-aws-vpc"
  }

  instance_tenancy     = "default"
  enable_dns_hostnames = true
}


resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.my-30Days-aws-vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1a"
  tags = {
    Name = "public-subnet"
  }
}


resource "aws_internet_gateway" "my-30Days-aws-igw" {
  vpc_id = aws_vpc.my-30Days-aws-vpc.id

  tags = {
    Name = "my-30Days-aws-igw"
  }

}

resource "aws_internet_gateway_attachment" "my-30Days-aws-igw-attachment" {
  vpc_id              = aws_vpc.my-30Days-aws-vpc.id
  internet_gateway_id = aws_internet_gateway.my-30Days-aws-igw.id

}

resource "aws_route_table" "my-30Days-aws-public-route-table" {
  vpc_id = aws_vpc.my-30Days-aws-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-30Days-aws-igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public-route-table-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.my-30Days-aws-public-route-table.id
}

