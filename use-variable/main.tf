provider "aws" {
  region = var.region
  profile = var.aws_profile

  default_tags = {
    tags = {
      Terraform   = var.terraform
      Environment = var.environment
    }
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_public_ip]
  }
}

resource "aws_instance" "ec2" {
  ami           = "ami-0a67d09dc01633721" # This is an example Amazon Linux 2 AMI ID; replace with the appropriate AMI ID for your region
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}

