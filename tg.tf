# Transit Gateway
resource "aws_ec2_transit_gateway" "Auto_TG" {
  description = "Transit Gateway for Private to Public traffic management"
  tags = {
    Name = "FrogTech_Transit_Gateway"
    Environment = "terraformChamps"
    Owner = "SOO28"
  }
}
# Attach VPC A and VPC B (Private) to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "TGW_Attachment_VPC_A" {
  subnet_ids         = aws_subnet.vpc_A_private_subnet.id
  transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id
  vpc_id             = aws_vpc.vpc_A_auto_trans.id

  tags = {
    Name = "TGW_Attachment_VPC_A"
    Environment = "terraformChamps"
    Owner = "SOO28"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "TGW_Attachment_VPC_B" {
  subnet_ids         = aws_subnet.vpc_B_private_subnet.id
  transit_gateway_id = aws_ec2_transit_gateway.Auto_TG.id
  vpc_id             = aws_vpc.vpc_B_auto_trans.id

  tags = {
    Name = "TGW_Attachment_VPC_B"
    Environment = "terraformChamps"
    Owner = "SOO28"
  }
}

# Route tables and routes for traffic flow
resource "aws_route" "private_to_public_route" {
  route_table_id         = aws_vpc.vpc_A_auto_trans.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = aws_ec2_transit_gateway.Auto_TG.id
}

