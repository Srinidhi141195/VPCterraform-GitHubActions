variable "vpc_cidr" {
    description = "vpc CIDR range"
    type = string
}

variable "subnet_cidr" {
  description = "Subnet CIDRS"
  type = list(string)
}