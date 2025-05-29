module "codestart_projects_instance" {
  source = "./modules/projectA"

  for_each = var.codestar_projects

  myapp_instances = each.value.myapp_instances
  vpc_id          = module.vpc.vpc_id
  subnet_id       = module.vpc.public_subnets[0]
}
