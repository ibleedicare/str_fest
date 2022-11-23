provider "digitalocean" {
    token = var.do_token 
}

resource "digitalocean_droplet" "obs" {
    image = "ubuntu-22-10-x64"
    name = "obs"
    size = "s-1vcpu-1gb-amd"
    region = "lon1"
    ssh_keys = [digitalocean_ssh_key.ssh_default.fingerprint]
}

resource "digitalocean_ssh_key" "ssh_default" {
    name = "Terraform ssh"
    public_key = var.ssh_key
}
