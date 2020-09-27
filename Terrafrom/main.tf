terraform {
  required_providers {
      aws = {
      source  = "hashicorp/aws"
      version = "3.6"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "terraform" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = "key"
  security_groups              = [
   "launch-wizard-1",
]
  vpc_segurity_group_ids	= [
   "sg-xxx",
]
}
