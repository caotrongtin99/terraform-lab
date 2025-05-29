variable "codestar_projects" {
  type = map(object({
    myapp_instances = map(object({
      ami           = string
      instance_type = string
      subnet_id     = optional(string)
    }))
  }))
  default = {
    project_a = {
      myapp_instances = {
        instance1 = {
          ami           = "ami-055d15d9cfddf7bd3"
          instance_type = "t2.micro"
        },
        instance2 = {
          ami           = "ami-01938df366ac2d954"
          instance_type = "t3.medium"
        }
      }
    }
  }
}
