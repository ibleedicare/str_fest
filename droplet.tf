provider "digitalocean" {
    token = var.do_token 
}

resource "digitalocean_droplet" "obs" {
    image = "ubuntu-22-10-x64"
    name = "obs"
    size = "s-1vcpu-1gb-amd"
    region = "lon1"
    ssh_keys = [digitalocean_ssh_key.ssh_default.fingerprint]

    provisioner "remote-exec" {

        inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]
        connection {
            host = self.ipv4_address
            type = "ssh"
            user = "root"
            private_key = file(var.ssh_key_pvt)
        }
    }

    provisioner "local-exec" {
        command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.ssh_key_pvt} -e 'pub_key=${var.ssh_key}' obs-install.yml"
    }
}

resource "digitalocean_ssh_key" "ssh_default" {
    name = "Terraform ssh"
    public_key = var.ssh_key
}
