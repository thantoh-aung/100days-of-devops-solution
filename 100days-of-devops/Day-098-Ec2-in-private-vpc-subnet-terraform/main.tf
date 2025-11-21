# -------------------------
# VPC
# -------------------------
resource "aws_vpc" "datacenter_priv_vpc" {
  cidr_block = var.KKE_VPC_CIDR
  tags = {
    Name = "datacenter-priv-vpc"
  }
}

# -------------------------
# Subnet
# -------------------------
resource "aws_subnet" "datacenter_priv_subnet" {
  vpc_id                  = aws_vpc.datacenter_priv_vpc.id
  cidr_block              = var.KKE_SUBNET_CIDR
  map_public_ip_on_launch = false

  tags = {
    Name = "datacenter-priv-subnet"
  }
}

# -------------------------
# Security Group
# Allow ONLY traffic from inside the VPC CIDR
# -------------------------
resource "aws_security_group" "priv_sg" {
  name        = "datacenter-priv-sg"
  vpc_id      = aws_vpc.datacenter_priv_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.KKE_VPC_CIDR]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# -------------------------
# EC2 Instance
# -------------------------
resource "aws_instance" "datacenter_priv_ec2" {
  ami           = "ami-0c101f26f147fa7fd" # VALID AMAZON LINUX 2 AMI
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.datacenter_priv_subnet.id
  vpc_security_group_ids = [aws_security_group.priv_sg.id]

  tags = {
    Name = "datacenter-priv-ec2"
  }
}