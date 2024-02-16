provider "aws" {
    region = var.aws_region
}


data "aws_ami" "ubuntu" {
  most_recent = true
  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]  # Canonical
}


resource "aws_key_pair" "tf_key" {
  key_name   = "tf_key"
  public_key = tls_private_key.rsa.public_key_openssh

  resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "Tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}


resource "aws_instance" "my-instance" {
    ami = data.aws_ami.ubuntu.id
    #key_name = "demo"



    instance_type = var.instance_type
}

