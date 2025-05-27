variable "ami" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "name" {
  type    = string
  default = "default-ec2-instance"
}
