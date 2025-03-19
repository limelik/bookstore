provider "aws" {
  region     = "us-west-1" 
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "bookstore_ec2" {
  ami                    = "ami-07d2649d67dbe8900" 
  instance_type          = "t2.micro"
  key_name               = "my-key-pair"
  iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name 

  tags = {
    Name = "Bookstore EC2 Instance"
  }
}

resource "aws_security_group" "ec2_sg" {
  name_prefix = "ec2-sg-"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
