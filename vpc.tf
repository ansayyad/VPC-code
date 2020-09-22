module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr

  route_out = true

  #Tags of VPC
  vpc_name = var.vpc_name
  contact_email  = var.contact_email
  contact_name   = var.contact_name

}
