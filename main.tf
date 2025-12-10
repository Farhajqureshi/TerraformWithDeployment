provider "aws" {
  region = var.region
}

module "sg" {
  source   = "./modules/security_groups"
  sg_name  = "docker-ec2-sg"
  vpc_id   = var.vpc_id
  app_port = var.app_port
}

# this is the ec2 terraform moule call 

module "ec2" {
  source         = "./modules/ec2"
  ami            = var.ami
  instance_type  = var.instance_type
  subnet_id      = var.subnet_id
  sg_id          = module.sg.sg_id
  key_name       = var.key_name
  app_port       = var.app_port
  ec2_name       = "Web-app-deploy"
}
