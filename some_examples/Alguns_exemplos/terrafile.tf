module "aws" {
  source = "./aws"
  aws    = 0
}
module "azure" {
  source = "./azure"
}
/*output "ip_address" {
    value = module.aws.ip_address
  
}*/