
# Create RSA Key Pair
resource "aws_key_pair" "datacenter_kp" {
  key_name   = "datacenter-kp"
  public_key = ""
}

# Create EC2 Instance
resource "aws_instance" "datacenter_ec2" {
  ami                    = "ami-0c101f26f147fa7fd"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.datacenter_kp.key_name
  vpc_security_group_ids = ["default"]

  tags = {
    Name = "datacenter-ec2"
  }
}