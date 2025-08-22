provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "http_ssh" {
  name        = "allow_http_ssh"
  description = "Allow HTTP and SSH for incoming traffic, and internet access for the outgoing traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "spring-server" {
  ami           = "ami-00ca32bbc84273381" # Amazon Linux 2023
  instance_type = "t2.micro"
  key_name      = "mykey"

  vpc_security_group_ids = [aws_security_group.http_ssh.id]
  
  tags = {
    Name = "spring-boot-server"
  }
}
