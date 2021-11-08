terraform {
  required_version = ">= 0.14"
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.9.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 1.13.3"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

#
# DNS
#
module "dns" {
  cloudflare_zone_id = var.cloudflare_zone_id
  cloudflare_api_key = var.cloudflare_api_key
  domain_name = var.domain_name
  cloudflare_email = var.cloudflare_email
  source        = "./modules/dns"
}

#
# DB
#
# module "db" {
#   source = "./modules/db"
#   mysql_root_pass = var.mysql_root_pass
# }