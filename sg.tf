### Create Security group for VPC_A EC2 Instances
resource "aws_security_group" "vpc_A_secgrp" {
  name        = "secgrp-1"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_A_auto_trans.id

    tags        = {
    Name        = "vpc_A_secgrp"
    Environment = "terraformChamps"
    Owner       = "Soo28"
        }
}

  resource "aws_vpc_security_group_ingress_rule" "allow_SSH-1" {
  security_group_id = aws_security_group.vpc_A_secgrp.id
  #cidr_ipv4        = aws_vpc.vpc_A_auto_trans.cidr_block
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

 resource "aws_vpc_security_group_egress_rule" "allow_SSH-1" {
  security_group_id = aws_security_group.vpc_A_secgrp.id
  #cidr_ipv4        = aws_vpc.vpc_A_auto_trans.cidr_block
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4-1" {
  security_group_id = aws_security_group.vpc_A_secgrp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"       # semantically equivalent to all ports
}


### Create Security group for VPC_B EC2 Instances
resource "aws_security_group" "vpc_B_secgrp" {
  name        = "secgrp-1"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_B_auto_trans.id

    tags        = {
    Name        = "vpc_B_secgrp"
    Environment = "terraformChamps"
    Owner       = "Soo28"
        }
}

  resource "aws_vpc_security_group_ingress_rule" "allow_SSH-2" {
  security_group_id = aws_security_group.vpc_B_secgrp.id
  #cidr_ipv4        = aws_vpc.vpc_B_auto_trans.cidr_block
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

 resource "aws_vpc_security_group_egress_rule" "allow_SSH-2" {
  security_group_id = aws_security_group.vpc_B_secgrp.id
  #cidr_ipv4        = aws_vpc.vpc_B_auto_trans.cidr_block
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4-2" {
  security_group_id = aws_security_group.vpc_B_secgrp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"          # semantically equivalent to all ports
}


# Create Bastion Host security group
resource "aws_security_group" "bastion-host-sg" {
  name        = "bastion-host-sg"
  description = "Allow SSH to bastion host"
  vpc_id      = aws_vpc.vpc_c_auto_trans.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 tags = {
    Name        = "bastionSG"
    Environment = "terraformChamps"
    Owner       = "soo28"
  }
}