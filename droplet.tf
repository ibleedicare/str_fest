terraform {
    required_providers {
        digitalocean = {
            source = "digitalocean/digitalocean"
            version = "~> 2.0"
        }
    }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "obs" {
    image = "debian-11-x64"
    name = "obs"
    region = "fra1"
    size = "s-1vcpu-1gb-amd"
}