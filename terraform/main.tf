module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16" #32-16=16, 2^16 = 65536 available Ip's
}
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}
module "lt" {
  source = "./modules/lt"
  eks_ng_security_group = module.sg.eks_ng_security_group
  instance_type         = "t2.medium"
  instance_profile_name = "Portfolio-eks-ng-lt"
}
module "asg" {
  source = "./modules/asg"
  name                  = "Portfolio-eks-nodes-asg"
  launch_template_id    = module.lt.eks-ng-lt
  subnet_ids            = module.vpc.private_subnet_ids
  target_group_arns     = module.alb.app_lb_tg_arn
  min_size              = 1 
  max_size              = 4
  desired_capacity      = 2
  
}
module "eks" {
  source             = "./modules/eks"
  cluster_name       = "Portfolio-eks-cluster"
  private_subnets    = module.vpc.private_subnet_ids
  ami_type           = "ami-0522ab6e1ddcc7055"
}
module "alb" {
  source             = "./modules/alb"
  vpc_id             = module.vpc.vpc_id
  public_subnet_a1   = module.vpc.public_subnet_az1
  alb_security_group = module.sg.alb_security_group
}
module "route53" {
  source             = "./modules/route53"
  domain_name        = "Sarva jawle"
  app_lb_dns         = module.alb.app_lb_dns
  app_lb_zone_id     = module.alb.appapp_lb_zone_id         
}
