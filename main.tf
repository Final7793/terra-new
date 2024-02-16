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


resource "aws_instance" "my-instance" {
    ami = data.aws_ami.ubuntu.id
    #key_name = "demo"



    instance_type = var.instance_type
}



resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Example security group created with Terraform"
    vpc_id      = "vpc-0234e221805288aa7"

  // Ingress rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
