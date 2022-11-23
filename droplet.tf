variable "do_token" {}
variable "ssh_key_path" {}

provider "digitalocean" {
    token = var.do_token 
}

resource "digitalocean_droplet" "obs" {

    connection {
        type = "ssh"
        user = "root"
        private_key = file("~/.ssh/id_rsa")
        host = self.ipv4_address
    }

    provisioner "remote-exec" {
        inline = [
            "apt-get install xfce4 -y"
        ]
    }
    image = "ubuntu-22-10-x64"
    name = "obs"
    size = "s-1vcpu-1gb-amd"
    region = "lon1"
    ssh_keys = [digitalocean_ssh_key.ssh_default.fingerprint]
}

resource "digitalocean_ssh_key" "ssh_default" {
    name = "Terraform ssh"
    public_key = var.ssh_key_path 
}