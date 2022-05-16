provider "aws" {
    region = "eu-west-1"
}
resource "aws_instance" "ec2" {
    ami = "ami-00c90dbdc12232b58"
    instance_type = "t2.micro"
#    security_groups = [aws_security_group.webtraffic.name]
}
resource "aws_eip" "elasticeip" {
    instance = aws_instance.ec2.id
    
}
resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"
    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]


    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}
output "EIP" {
    value = aws_eip.elasticeip.public_ip
  
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