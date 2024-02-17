provider "aws" {
    region = ap-south-1
}



   resource "aws_instance" "example" {
  ami           = "ami-0449c34f967dbf18a"  # Specify your desired AMI ID
  instance_type = "t2.micro"      # Specify your desired instance type
 

  tags = {
    Name = "example-instance"  # Specify your desired name for the instance
  }
}
