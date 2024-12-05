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

