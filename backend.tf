terraform {
  backend "local" {
   path = "/var/www/terraform.tfstate"
  }
}