### Create a route table to route to transit gateway for VPC-A
resource "aws_route_table" "rt-A" {
  vpc_id    = aws_vpc.vpc_A_auto_trans.id

 # Route all traffic through the Transit Gateway

    route { 
    cidr_block = "0.0.0.0/0"
    transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id
  }

  route {  # route to vpc-B
    cidr_block = "10.1.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id
  }

    route {  # route to vpc-C
    cidr_block = "10.2.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id
  }

  tags = {
    Name        = "rt-A"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}

# Create Route table association to Subnet-A in VPC-A
resource "aws_route_table_association" "rt-A-ass-1" {
  subnet_id = aws_subnet.vpc_A_private_subnet.id
  route_table_id = aws_route_table.rt-A.id
}



### Create a route table to route to transit gateway for VPC-B
resource "aws_route_table" "rt-B" {
  vpc_id    = aws_vpc.vpc_B_auto_trans.id

 # Route all traffic through the Transit Gateway

  route {  
    cidr_block = "0.0.0.0/0"
    transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id
  }

  route {  # route to vpc-A
    cidr_block = "10.0.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id
  }

    route {  # route to vpc-C
    cidr_block = "10.2.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id
  }


  tags = {
    Name        = "rt-B"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}

# Create Route table association to Subnet-B in VPC-B
resource "aws_route_table_association" "rt-B-ass-2" {
  subnet_id = aws_subnet.vpc_B_private_subnet.id
  route_table_id = aws_route_table.rt-B.id
}


### Create the route for subnet-C to internet gateway/public subnet
resource "aws_route_table" "rt_C_pub_subnet" {
  vpc_id = aws_vpc.vpc_c_auto_trans.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_c_igw.id
  }

  route {  # route to vpc-A
    cidr_block = "10.0.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id
  }

    route {  # route to vpc-B
    cidr_block = "10.1.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id
  }

}


# Associate the route table to the public subnet
resource "aws_route_table_association" "rt_pub_associate" {
  subnet_id      = aws_subnet.vpc_c_public_subnet.id  # Corrected to associate with the public subnet
  route_table_id = aws_route_table.rt_C_pub_subnet.id
}