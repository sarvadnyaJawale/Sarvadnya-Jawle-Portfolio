module "vpc" {
  source                = "./modules/vpc"
  vpc_cidr              = "10.0.0.0/16" #32-16=16, 2^16 = 65536 available Ip's
}
module "sg" {           #allowed inbound traffic on port 80 from all IPs (0.0.0.0/0) for ALB and from ALB to EKS Nodes.
  source                = "./modules/sg"  
  vpc_id                = module.vpc.vpc_id
}
module "lt" {
  source                = "./modules/lt"
  private_subnets       = module.vpc.private_subnet_ids
  ssh_http_sg           = module.sg.ssh_http_sgs
  instance_type         = "t2.medium"
}
module "asg" {          # in future add Auto Scaling Policies based on CPU, Memory and Performance as per your monitoring
  source                = "./modules/asg"  
  name                  = "Portfolio-ec2-asg"
  launch_template_id    = module.lt.ec2-lt
  subnet_ids            = module.vpc.private_subnet_ids
  target_group_arns     = module.alb.app_lb_tg_arn
  min_size              = 1 
  max_size              = 2
  desired_capacity      = 1
  
}
module "alb" {
  source                = "./modules/alb"
  vpc_id                = module.vpc.vpc_id
  # acm_certificate_arn   = module.acm.acm_certificate_arn
  public-asg-id         = module.asg.asg_id
  sg_http_ssh           = module.sg.ssh_http_sgs
  public_subnet_az1     = module.vpc.public_subnet_az1
  public_subnet_az2     = module.vpc.public_subnet_az2
  alb_security_group    = module.sg.alb_security_group
}
# module "route53" {
#  source                = "./modules/route53"
#  domain_name           = "sarvadnya.tech"
#  app_lb_dns            = module.alb.app_lb_dns
#  app_lb_zone_id        = module.alb.app_lb_zone_id      
# }
# module "acm" {
#   source                = "./modules/acm"
#   route53_zone_id       = module.route53.route53_zone_id 
# }
