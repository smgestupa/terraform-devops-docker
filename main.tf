module "vpc" {
  source = "./modules/vpc"

  name = var.vpc_name
  cidr = var.vpc_cidr

  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support   = var.vpc_enable_dns_support

  create_internet_gateway = var.vpc_create_internet_gateway
}

module "subnet_public" {
  source = "./modules/subnet"

  name  = var.subnet_public_name
  cidrs = var.subnet_public_cidrs

  availability_zones = [data.aws_availability_zones.this.names[0]]

  vpc_id = module.vpc.this.id

  create_route_table = {
    name = var.subnet_public_create_route_table.name

    routes = [
      merge(element(var.subnet_public_create_route_table.routes, 0), {
        gateway_id = module.vpc.internet_gateway.id
      })
    ]
  }
}

module "role_app" {
  source = "./modules/iam-role"

  name = var.role_app_name

  assume_policy_document  = var.role_app_assume_policy_document
  create_instance_profile = var.role_app_create_instance_profile

  policy_attachments = [data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn]
}

module "sg_app" {
  source = "./modules/sg"

  name   = var.sg_app_name
  vpc_id = module.vpc.this.id

  create_ingress_rules = local.sg_app_create_ingress_rules
  create_egress_rules  = var.sg_app_create_egress_rules
}

module "ec2_app" {
  source = "./modules/ec2"

  name     = var.ec2_app_name
  ami      = data.aws_ami.this.image_id
  key_name = var.ec2_app_key_name

  subnet_id                   = module.subnet_public.this[0].id
  associate_public_ip_address = var.ec2_app_associate_public_ip_address
  vpc_security_group_ids      = [module.sg_app.this.id]

  create_root_block_device = var.ec2_app_create_root_block_device

  monitoring = var.ec2_app_monitoring

  iam_instance_profile = module.role_app.instance_profile.name

  user_data = filebase64("${path.module}/scripts/ec2_init.sh")

}