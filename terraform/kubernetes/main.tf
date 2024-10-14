provider "aws" {
  region = "eu-west-3" # Changez selon vos préférences
}

module "vpc" {
  source               = "./modules/vpc"
  cidr_block           = "10.0.0.0/16"
  availability_zones   = ["eu-west-3a", "eu-west-3b"]
  public_subnet_count  = 2
  private_subnet_count = 2
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = "my-k8s-cluster"
  node_group_name = "my-node-group"
  subnet_ids      = module.vpc.public_subnet_ids 
  desired_size    = 2
  max_size        = 3
  min_size        = 1
  instance_type   = "t2.micro"
}
