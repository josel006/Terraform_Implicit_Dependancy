################## Implicit Dependancy############################
## Due to the instance attribute (.id) in the eip configuration block,
# Terraform understands that it needs to create the EC2 instance before
# the EIP such that it can associate the eip with the instance


provider "aws" {
  region  = "us-east-1"
  profile = "default" # This is the name on your local computer used by Terraform.
}

resource "aws_eip" "myeip" {
  domain   = "vpc"
  instance = aws_instance.myec2.id # This is the depencency that links the EC2 instance with the Elastic IP.
  tags = {
    Name = "my-assigned-eip-name" # This is the name for the Elastic IP.
  }
}
resource "aws_instance" "myec2" { # If creating multiple instances you must change the local name on each instance.
  instance_type = "t2.micro"
  ami           = "ami-07ff62358b87c7116" # You must ensure the AIM is valid on your Region, check this value on AWS. 
  tags = {
    Name = "HelloWorld" # This is the name for the EC2 instance.
  }
}

