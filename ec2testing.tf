# Create key pair for SSH access into EC2 instances
resource "aws_key_pair" "ssh_key_1"{
  key_name  = "ssh_key_1"
  public_key = file("~/.ssh/id_rsa.pub")
}

# EC2 Instance in VPC_A for Testing

resource "aws_instance" "vpc_A_ec2_testing"{
    ami                    = "ami-005fc0f236362e99f"  #Ubuntu 22.04 AMI
    instance_type          = "t2.micro"
    subnet_id              = aws_subnet.vpc_A_private_subnet.id
    vpc_security_group_ids = [aws_security_group.vpc_A_secgrp.id]
}


# EC2 Instance in VPC_B for Testing

resource "aws_instance" "vpc_B_ec2_testing"{
    ami                    = "ami-005fc0f236362e99f"  #Ubuntu 22.04 AMI
    instance_type          = "t2.micro"
    subnet_id              = aws_subnet.vpc_B_private_subnet.id
    vpc_security_group_ids = [aws_security_group.vpc_B_secgrp.id]
}


