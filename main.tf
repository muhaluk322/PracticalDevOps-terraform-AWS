provider "aws" {
  #region is using variables.tf file
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source      = "./modules/subnet"
  vpc_id      = module.vpc.vpc_id
  environment = module.vpc.environment
}

module "sg" {
  source      = "./modules/sg"
  vpc_id      = module.vpc.vpc_id
  environment = module.vpc.environment
}

module "ec2" {
  source                 = "./modules/ec2"
  publicSubnetCIDR       = module.subnet.publicSubnetCIDR
  subnet_id              = module.subnet.subnet_id
  vpc_security_group_ids = module.sg.vpc_security_group_ids
}
