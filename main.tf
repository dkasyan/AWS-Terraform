provider "aws" {
    region = "eu-west-1"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        name = "TerraformVPC"
    }
  
}

resource "aws_instance" "ec2" {
    ami = "ami-00c90dbdc12232b58"
    instance_type = "t2.micro"
}
#output "vpcid" {
#    value = aws_vpc.myvpc.myvpc.id
     
#}
#variable "multiple" {
#  type = tuple([string, number, string])
#  default = ["cat", 1, "dog"]
#}
#variable "myobject" {
 #   type = object({name = string, port = list(number) })
  #  default = {
  #    name = "TJ"
  #    port = [22, 25, 80]
  #  }
  
#}