## Transit Gateway
resource "aws_ec2_transit_gateway" "Auto_TG" {
  description = "Transit Gateway for Private to Public traffic management"
  tags = {
    Name = "FrogTech_Transit_Gateway"
    Environment = "terraformChamps"
    Owner = "SOO28"
  }
}
## Attach Subnet A and Subnet B(Private) to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "TGW_Attachment_A" {
  subnet_ids         = [aws_subnet.vpc_A_private_subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id
  vpc_id             = aws_vpc.vpc_A_auto_trans.id

  tags = {
    Name = "TGW_Attachment_A"
    Environment = "terraformChamps"
    Owner = "SOO28"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "TGW_Attachment_B" {
  subnet_ids         = [aws_subnet.vpc_B_private_subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id
  vpc_id             = aws_vpc.vpc_B_auto_trans.id

  tags = {
    Name = "TGW_Attachment_VPC_B"
    Environment = "terraformChamps"
    Owner = "SOO28"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "TGW_Attachment_C" {
  subnet_ids         = [aws_subnet.vpc_c_public_subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id
  vpc_id             = aws_vpc.vpc_c_auto_trans.id

  tags = {
    Name = "TGW_Attachment_VPC_C"
    Environment = "terraformChamps"
    Owner = "SOO28"
  }
}

# Create a transit gateway route table
resource "aws_ec2_transit_gateway_route_table" "TG_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id

  tags = {
    Name = "TG_ec2_rt"
    Environment = "terraformChamps"
    Owner = "SOO28"
  }
}

