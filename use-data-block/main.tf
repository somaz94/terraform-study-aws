provider "aws" {
  region = var.region
  profile = var.aws_profile

  default_tags {
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


data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical, the official owner of Ubuntu AMIs

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id # This is an example Ubuntu Linux 20.04 AMI ID; replace with the appropriate AMI ID for your region
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}

