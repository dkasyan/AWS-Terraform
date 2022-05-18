resource "aws_instance" "db" {
    ami = "ami-00c90dbdc12232b58"
    instance_type = "t2.micro"
#   Use tags with the sign equal " = "
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

# Show EIP of web server
resource "aws_eip" "web_ip" {
    instance = aws_instance.web.id
  
}

variable "ingress" {
  type = list(number)
  default = [ 80,443 ]
}

variable "egress" {
  type = list(number)
  default = [ 80,443 ]
}

resource "aws_security_group" "web_traffic" {
    name = "Allow Web Traffic"
#   Dynamic block for each port 
    dynamic "ingress" {
        iterator = port
        for_each = var.ingress
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    dynamic "egress" {
    iterator = port
    for_each = var.egress
    content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    }
}
