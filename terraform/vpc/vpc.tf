#Creating VPC Network

resource "aws_vpc" "main_VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = var.cloud_name
  }
}


#Creating Subnets

resource "aws_subnet" "PUB_A" {
  vpc_id     = aws_vpc.main_VPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "${var.cloud_name}_PUB_A"
}
}

resource "aws_subnet" "PUB_B" {
  vpc_id     = aws_vpc.main_VPC.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "${var.cloud_name}_PUB_B"
}
}

resource "aws_subnet" "PUB_C" {
  vpc_id     = aws_vpc.main_VPC.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-1c"

  tags = {
    Name = "${var.cloud_name}_PUB_C"
}
}

resource "aws_subnet" "DMZ_A" {
  vpc_id     = aws_vpc.main_VPC.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "${var.cloud_name}_DMZ_A"
}
}

resource "aws_subnet" "DMZ_B" {
  vpc_id     = aws_vpc.main_VPC.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "${var.cloud_name}_DMZ_B"
}
}

resource "aws_subnet" "DMZ_C" {
  vpc_id     = aws_vpc.main_VPC.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "eu-west-1c"

  tags = {
    Name = "${var.cloud_name}_DMZ_C"
}
}

#Create Internet Gateway

resource "aws_internet_gateway" "GW" {
  vpc_id = aws_vpc.main_VPC.id

  tags = {
    Name = "${var.cloud_name}_IGW"
  }
}

#Create Routing

resource "aws_route_table" "ROUTE_TABLE" {
    vpc_id = aws_vpc.main_VPC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.GW.id
    }

    tags = {
        Name = "${var.cloud_name}_ROUTE_TABLE"
    }
}

# Association Routing
resource "aws_route_table_association" "ASS_ROUTE_TABLE_PUB_A" {
    subnet_id = aws_subnet.PUB_A.id
    route_table_id = aws_route_table.ROUTE_TABLE.id
}

resource "aws_route_table_association" "ASS_ROUTE_TABLE_PUB_B" {
    subnet_id = aws_subnet.PUB_B.id
    route_table_id = aws_route_table.ROUTE_TABLE.id
}

resource "aws_route_table_association" "ASS_ROUTE_TABLE_PUB_C" {
    subnet_id = aws_subnet.PUB_C.id
    route_table_id = aws_route_table.ROUTE_TABLE.id
}

#Security group
resource "aws_security_group" "web_traffic" {
    vpc_id     = aws_vpc.main_VPC.id
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
    tags = {
      Name = "${var.cloud_name}_SECGROUP"
    }
  
}

# Show EIP of web server
resource "aws_eip" "web_ip" {
    instance = aws_instance.web.id
}
