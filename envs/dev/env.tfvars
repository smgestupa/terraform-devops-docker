my_ip  = "0.0.0.0/0"
region = "ap-southeast-1"
tags   = {
  Environment = "dev"
  Project     = "terraform-devops-docker"
  Owner       = "Shawn Gestupa"
}

vpc_name                    = "devops-test-vpc"
vpc_cidr                    = "10.250.0.0/16"
vpc_enable_dns_hostnames    = true
vpc_enable_dns_support      = true
vpc_create_internet_gateway = true

subnet_public_name               = "devops-test-pub-subnet-001"
subnet_public_cidrs              = "10.250.0.0/24"
subnet_public_create_route_table = {
  name = "devops-test-public"

  routes = [{
    cidr_block = "0.0.0.0/0"
  }]
}

sg_app_name                 = "devops-test-sg-app"
sg_app_create_ingress_rules = [
  {
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "icmp"
  },
  {
    cidr_ipv4 = "0.0.0.0/0"
    from_port = "22"
    to_port = "22"
    ip_protocol = "tcp"
  }
]
sg_app_create_egress_rules = [
  {
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
  }
]

role_app_name                   = "devops-test-app"
role_app_assume_policy_document = [{
  effect = "Allow"
  actions = ["sts:AssumeRole"]

  principals = [{
    type = "Service"
    identifiers = ["ec2.amazonaws.com"]
  }]
}]
role_app_create_instance_profile = true

ec2_app_name                        = "devops-test-app"
ec2_app_update_default_version      = true
ec2_app_associate_public_ip_address = true
ec2_app_monitoring                  = false
ec2_app_create_root_block_device    = {
  encrypted = true
}