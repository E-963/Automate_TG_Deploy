# create a bastionHost 
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