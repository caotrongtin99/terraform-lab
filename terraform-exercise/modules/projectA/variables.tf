variable "myapp_instances" {
  type = map(object({
    ami           = string
    instance_type = string
  }))
  /*
  default = {
    "myapp1" = {
      ami           = "ami-055d15d9cfddf7bd3"
      instance_type = "t2.micro"
      name          = "demo-lab1"
    }
    "myapp2" = {
      ami           = "ami-055d15d9cfddf7bd3"
      instance_type = "t2.micro"
      name          = "demo-lab2"
    }
  }
*/
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}
