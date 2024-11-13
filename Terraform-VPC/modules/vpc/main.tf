#vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    "Name" = "my_vpc"
  }
}

#Subnets
resource "aws_subnet" "subnets" {
    count = length(var.subnet_cidr)   #subnet_cidr values for two subnets range with their length being considered as a count
    vpc_id     = aws_vpc.my_vpc.id    #assigning the vpc ID details
    cidr_block = var.subnet_cidr[count.index]       #count.index for the CIDR block which has two subnets so the length is 2.
    availability_zone = data.aws_availability_zones.available.names[count.index]    #Extracting the availability zones information with count
    map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_names[count.index]               #tagging the subnet names count which is two subnets so 2
  }
}

#internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_internet_gateway"
  }
}

#Route tables

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "MyRouteTable"
  }
}

#Route table association

resource "aws_route_table_association" "rta" {
    count = length(var.subnet_cidr)
    subnet_id = aws_subnet.subnets[count.index].id
    route_table_id = aws_route_table.rt.id
}