#resource "aws_instance" "db" {
#    ami = "ami-00c90dbdc12232b58"
#    instance_type = "t2.micro"
#   Use tags with the sign equal " = "
#    tags = {
#        Name = "DB Server"
#    }
#}

resource "aws_instance" "web" {
    ami = "ami-01720b5f421cf0179"
    instance_type = "t2.micro"
    security_groups = [ aws_security_group.web_traffic.id ]
    subnet_id = aws_subnet.PUB_A.id
#    vpc_id     = aws_vpc.main_VPC.id
    user_data = file("server-php.sh")
    tags = {
        Name = "Web Server"
    }
}