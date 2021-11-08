terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

resource "cloudflare_record" "mx" {
  name    = "mx"
  value   = "66.96.140.129"
  type    = "A"
  proxied = true
  zone_id = var.cloudflare_zone_id
  ttl = 1
}

resource "cloudflare_record" "mx2" {
  name    = "mx"
  value   = "66.96.140.128"
  type    = "A"
  proxied = true
  zone_id = var.cloudflare_zone_id
  ttl = 1
}

resource "cloudflare_record" "main" {
  name    = "*"
  value   = "164.90.212.246"
  type    = "A"
  proxied = false
  zone_id = var.cloudflare_zone_id
  ttl = 1
}

resource "cloudflare_record" "onetwocareer" {
  name    = "onetwocareer.com"
  value   = "164.90.212.246"
  type    = "A"
  proxied = true
  zone_id = var.cloudflare_zone_id
  ttl = 1
}

resource "cloudflare_record" "www" {
  name    = "www"
  value   = "164.90.212.246"
  type    = "A"
  proxied = true
  zone_id = var.cloudflare_zone_id
  ttl = 1
}


resource "cloudflare_record" "acmechallenge" {
  name    = "_acme-challenge"
  value   = "onetwocareer.com.letsencrypt.vdeck.eigdyn.com"
  type    = "CNAME"
  proxied = true
  zone_id = var.cloudflare_zone_id
  ttl = 1
}

resource "cloudflare_record" "em719" {
  name    = "em719"
  value   = "u21679727.wl228.sendgrid.net"
  type    = "CNAME"
  proxied = false
  zone_id = var.cloudflare_zone_id
  ttl = 1
}

resource "cloudflare_record" "s1domainkey" {
  name    = "s1._domainkey"
  value   = "s1.domainkey.u21679727.wl228.sendgrid.net"
  type    = "CNAME"
  proxied = false
  zone_id = var.cloudflare_zone_id
  ttl = 1
}

resource "cloudflare_record" "s2domainkey" {
  name    = "s2._domainkey"
  value   = "s2.domainkey.u21679727.wl228.sendgrid.net"
  type    = "CNAME"
  proxied = false
  zone_id = var.cloudflare_zone_id
  ttl = 1
}

resource "cloudflare_record" "allmx" {
  name    = "*"
  value   = "mx.domain.com"
  type    = "MX"
  proxied = false
  zone_id = var.cloudflare_zone_id
  ttl = 1
  priority = 10
}

resource "cloudflare_record" "mxonetwocareer" {
  name    = "onetwocareer.com"
  value   = "mx.domain.com"
  type    = "MX"
  proxied = false
  zone_id = var.cloudflare_zone_id
  ttl = 1
  priority = 10
}
