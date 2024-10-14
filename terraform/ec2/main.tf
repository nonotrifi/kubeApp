provider "aws" {
  region = "eu-west-3"  # Changez la région selon vos préférences
}

resource "aws_instance" "app_server" {
  ami           = "ami-0574a94188d1b84a1" # Remplacez par l'AMI de votre choix
  instance_type = "t2.micro" # Choisissez un type d'instance adapté
  key_name      = "key-paris" # Remplacez par le nom de votre paire de clés

  tags = {
    Name = "AppServer"
  }

  vpc_security_group_ids = [aws_security_group.allow_http.id]
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 3000
    to_port     = 3000
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


terraform {
  backend "s3" {
    bucket         = "terraformbucket57"
    key            = "terraform/state"
    region         = "eu-west-3"
  }
}
