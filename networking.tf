resource "aws_vpc" "my-30Days-aws-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-30Days-aws-vpc"
  }

  instance_tenancy     = "default"
  enable_dns_hostnames = true
}

# Create a public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.my-30Days-aws-vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones
  tags = {
    Name = "${var.common_tags}-public-subnet"
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "my-30Days-aws-igw" {
  vpc_id = aws_vpc.my-30Days-aws-vpc.id

  tags = {
    Name = "${var.common_tags}-igw"
  }

}
# Attach the internet gateway to the VPC
# resource "aws_internet_gateway_attachment" "my-30Days-aws-igw-attachment" {
#   vpc_id              = aws_vpc.my-30Days-aws-vpc.id
#   internet_gateway_id = aws_internet_gateway.my-30Days-aws-igw.id

# }

# Create a route table
resource "aws_route_table" "my-30Days-aws-public-route-table" {
  vpc_id = aws_vpc.my-30Days-aws-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-30Days-aws-igw.id
  }

  tags = {
    Name = "${var.common_tags}-public-route-table"
  }
}

# Associate the route table with the public subnet
resource "aws_route_table_association" "public-route-table-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.my-30Days-aws-public-route-table.id
}


#create a private subnet
resource "aws_subnet" "private-subnet" {
  vpc_id                  = aws_vpc.my-30Days-aws-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = false
  availability_zone       = var.availability_zones
  tags = {
    Name = "${var.common_tags}-private-subnet"
  }
}
