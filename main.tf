resource "aws_instance" "db" {
    ami = "ami-00c90dbdc12232b58"
    instance_type = "t2.micro"
    tags = {
        Name = "DB Server"
    }
}
resource "aws_instance" "web" {
    ami = "ami-00c90dbdc12232b58"
    instance_type = "t2.micro"
    tags = {
        Name = "Web Server"
    }
}

resource "aws_eip" "web_ip" {
    instance = aws_instance.web.id
  
}