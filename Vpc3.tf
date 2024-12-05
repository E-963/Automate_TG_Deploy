## VPC_3 Configuration with Public Subnet

resource "aws_vpc" "vpc_c_auto_trans" {
  cidr_block = "10.2.0.0/16"
  tags = {
    Name        = "vpc_c_auto_trans"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}

# Create subnet-3 for vpc_c Public subnet

resource "aws_subnet" "vpc_c_public_subnet" {
  vpc_id     = aws_vpc.vpc_c_auto_trans.id
  cidr_block = "10.2.1.0/24"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true   ##Specify true to indicate that instances launched into the subnet should be assigned a public IP address.

  tags = {
    Name        = "vpc_c_auto_trans"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}

## Creat an Internet Gateway for VPC_3

resource "aws_internet_gateway" "vpc_c_igw" {
  vpc_id = aws_vpc.vpc_c_auto_trans.id

  tags = {
    Name = "vpc_c_igw"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}

# Create the route for subnet-3 to internet gateway/ public subnet
resource "aws_route_table" "rt_3_pub_subnet" {
  vpc_id = aws_vpc.vpc_c_auto_trans.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_c_igw.id
  }
}

# Associate the route table to  an internet gateway 
resource "aws_route_table_association" "rt_pub_associate" {
  gateway_id     = aws_internet_gateway.vpc_c_igw.id
  route_table_id = aws_route_table.rt_3_pub_subnet.id
}