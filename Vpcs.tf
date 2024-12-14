#######################
# VPC_A Configuration
#######################
resource "aws_vpc" "vpc_A_auto_trans" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name        = "vpc_A_auto_trans"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}


# Create private subnet for VPC A
resource "aws_subnet" "vpc_A_private_subnet" {
  vpc_id            = aws_vpc.vpc_A_auto_trans.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name        = "vpc_A_private_subnet"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}


#######################
# VPC_B Configuration
#######################
resource "aws_vpc" "vpc_B_auto_trans" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name        = "vpc_B_auto_trans"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}

# Create private subnet for VPC B
resource "aws_subnet" "vpc_B_private_subnet" {
  vpc_id            = aws_vpc.vpc_B_auto_trans.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name        = "vpc_B_private_subnet"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}
##########################################
## VPC_C Configuration with Public Subnet
##########################################
resource "aws_vpc" "vpc_c_auto_trans" {
  cidr_block = "10.2.0.0/16"
  tags = {
    Name        = "vpc_c_auto_trans"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}

# Create subnet-C for VPC_C Public subnet
resource "aws_subnet" "vpc_c_public_subnet" {
  vpc_id                  = aws_vpc.vpc_c_auto_trans.id
  cidr_block              = "10.2.1.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true  # Specify true to indicate that instances launched into the subnet should be assigned a public IP address.

  tags = {
    Name        = "vpc_c_public_subnet"  # Changed the name to reflect that this is a public subnet
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}

## Create an Internet Gateway for VPC_C
resource "aws_internet_gateway" "vpc_c_igw" {
  vpc_id = aws_vpc.vpc_c_auto_trans.id

  tags = {
    Name        = "vpc_c_igw"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}

