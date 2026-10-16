provider "aws" {
  region = "eu-west-2"
}

module "app" {
  source      = "./modules/app"
  environment = var.environment
}
