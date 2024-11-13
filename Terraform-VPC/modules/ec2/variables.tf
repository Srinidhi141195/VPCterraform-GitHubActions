variable "sg_id" {
    description = "SG ID of ec2"
    type = string
}


variable "subnets" {
    description = "Subnets for EC2"
    type = list(string)
}


variable "ec2_names" {
    description = "ec2 names"
    type = list(string)
    default = [ "WebServer1", "WebServer2" ]
}