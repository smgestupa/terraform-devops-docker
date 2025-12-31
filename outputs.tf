output "app_public_dns" {
  value = module.ec2_app.this.public_dns
}