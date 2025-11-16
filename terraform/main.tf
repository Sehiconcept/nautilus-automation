# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create RSA key pair
resource "tls_private_key" "devops_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save private key to file
resource "local_file" "private_key" {
  content  = tls_private_key.devops_key.private_key_pem
  filename = "devops-kp.pem"
}

# Create key pair in AWS
resource "aws_key_pair" "devops_key_pair" {
  key_name   = "devops-kp"
  public_key = tls_private_key.devops_key.public_key_openssh
}

# Create EC2 instance
resource "aws_instance" "devops_ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.devops_key_pair.key_name

  tags = {
    Name = "devops-ec2"
  }
}
