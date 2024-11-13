variable "sg_id" {
  description = "sd id for app lb"
  type = string
}

variable "subnets" {
  description = "subnets for alb"
  type = list(string)
}


variable "vpc_id" {
  description = "VPC ID for tg"
  type = string
}


variable "intances" {
  description = "Intance ID for TGA"
  type = list(string)
}