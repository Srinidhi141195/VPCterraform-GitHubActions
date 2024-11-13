variable "vpc_cidr" {
    description = "vpc CIDR range"
    type = string
}

variable "subnet_cidr" {
    description = "Subnet CIDRS"
    type = list(string)
}


variable "subnet_names" {
    description = "subnet names"
    type = list(string)
    default = [ "PublicSubnet1", "PublicSunet2" ]
  
}