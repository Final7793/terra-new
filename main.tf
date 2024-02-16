provider "aws" {
    region = var.aws_region
}

resource "aws_instance" "my-instance" {
    ami = "ami-0449c34f967dbf18a"
    instance_type = var.instance_type
}

