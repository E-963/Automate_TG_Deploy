# Create key pair for SSH access into EC2 instances
resource "aws_key_pair" "ssh_key_1"{
  key_name  = "ssh_key_1"
  public_key = file("~/.ssh/id_rsa.pub")
}

# EC2-A Instance in VPC_A for Testing

resource "aws_instance" "EC2_A_testing"{
    ami                    = "ami-005fc0f236362e99f"  #Ubuntu 22.04 AMI
    instance_type          = "t2.micro"
    associate_public_ip_address   = true
    subnet_id              = aws_subnet.vpc_A_private_subnet.id
    vpc_security_group_ids = [aws_security_group.vpc_A_secgrp.id]
    key_name               = aws_key_pair.ssh_key_1.key_name

    tags = {
    Name        = "EC2_A_testing"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}


# EC2 Instance in VPC_B for Testing

resource "aws_instance" "EC2_B_testing"{
    ami                    = "ami-005fc0f236362e99f"  #Ubuntu 22.04 AMI
    instance_type          = "t2.micro"
    subnet_id              = aws_subnet.vpc_B_private_subnet.id
    vpc_security_group_ids = [aws_security_group.vpc_B_secgrp.id]
    key_name               = aws_key_pair.ssh_key_1.key_name    # use the same key

    tags = {
    Name        = "EC2_B_testing"
    Environment = "terraformChamps"
    Owner       = "Soo28"
  }
}


########################
# create a bastionHost 
########################
resource "aws_instance" "bastion-host" {
  ami                    = "ami-0a0e5d9c7acc336f1" # Amazon Ubuntu 22.04 AMI in us-east-1
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.vpc_c_public_subnet.id
  key_name                = aws_key_pair.ssh_key_1.key_name
  vpc_security_group_ids = [aws_security_group.bastion-host-sg.id]

  tags = {
    Name        = "BastionHost"
    Environment = "terraformChamps"
    Owner       = "soo28"
  }
}