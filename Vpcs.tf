# VPC_A Configuration
resource"aws_vpc" "vpc_A_auto_trans"{
  cidr_block = "10.0.0.0/16"
  tags = {
    Name        = "vpc_A_auto_trans"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}

#Create private subnet for vpc A
  resource "aws_subnet" "vpc_A_private_subnet"{
    vpc_id  =aws_vpc.vpc_A_auto_trans.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
            Name        = "vpc_A_private_subnet"
            Environment = "terraformChamps"
            Owner       = "Soo28"
        }
    
    }

# VPC_B Configuration
resource "aws_vpc" "vpc_B_auto_trans"{
  cidr_block = "10.1.0.0/16"
  tags = {
    Name        = "vpc_B_auto_trans"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}

#Create private subnet for vpc B
  resource "aws_subnet" "vpc_B_private_subnet"{
    vpc_id  =aws_vpc.vpc_B_auto_trans.id
    cidr_block = "10.1.1.0/24"
    availability_zone = "us-east-1b"
    tags = {
            Name        = "vpc_B_private_subnet"
            Environment = "terraformChamps"
            Owner       = "Soo28"
        }
    }


## VPC_C Configuration with Public Subnet

resource "aws_vpc" "vpc_c_auto_trans" {
  cidr_block = "10.2.0.0/16"
  tags = {
    Name        = "vpc_c_auto_trans"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}

# Create subnet-C for vpc_c Public subnet

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

## Creat an Internet Gateway for VPC_C

resource "aws_internet_gateway" "vpc_c_igw" {
  vpc_id = aws_vpc.vpc_c_auto_trans.id

  tags = {
    Name = "vpc_c_igw"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}

# Create the route for subnet-C to internet gateway/ public subnet
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