package main

deny[msg] {
    not input.resource.digitalocean_droplet.obs
    msg = "Define droplet resource"
}

deny[msg] {
    not input.resource.digitalocean_droplet.obs.provisioner
    msg = "No provisioner local-exec"
}

deny[msg] {
    not input.resource.digitalocean_droplet.obs.image
    msg = "Droplet should have an image defined"
}

deny[msg] {
    image := input.resource.digitalocean_droplet.obs.image
    not image == "ubuntu-22-10-x64"
    msg = "Droplet image should be ubuntu 22.10 x64"
}

deny[msg] {
    not input.resource.digitalocean_droplet.obs.name
    msg = "Droplet should have an name field"
}

deny[msg] {
    name := input.resource.digitalocean_droplet.obs.name
    not name == "obs"
    msg = "Droplet name should be obs"
}

deny[msg] {
    not input.resource.digitalocean_droplet.obs.size
    msg = "Droplet should have a size field"
    
}

deny[msg] {
    size := input.resource.digitalocean_droplet.obs.size
    not size == "s-1vcpu-1gb-amd"
    msg = "Droplet size should be s-1vcpu-1gb-amd"
}

deny[msg] {
    not input.resource.digitalocean_droplet.obs.region
    msg = "Droplet should have a region field"
}

deny[msg] {
    region := input.resource.digitalocean_droplet.obs.region
    not region == "lon1"
    msg = "Droplet region should be lon1"
}

deny[msg] {
    not input.resource.digitalocean_droplet.obs.ssh_keys
    msg = "Droplet should have a ssh_keys field"
}

# Digital ocean ssh key

deny[msg] {
    not input.resource.digitalocean_ssh_key.ssh_default
    msg = "Droplet ssh key resource should be defined"
}

deny[msg] {
    not input.resource.digitalocean_ssh_key.ssh_default.name
    msg = "Droplet ssh key resource should have name field"
}

deny[msg] {
    name := input.resource.digitalocean_ssh_key.ssh_default.name
    not name == "Terraform ssh"
    msg = "Droplet ssh key name should be `Terraform ssh`"
}

deny[msg] {
    not input.resource.digitalocean_ssh_key.ssh_default.public_key
    msg = "Droplet ssh key resource should have public_key field"
}

deny[msg] {
    not contains(input.resource.digitalocean_ssh_key.ssh_default.public_key, "var.ssh_key")
    msg = "Droplet ssh key resource should have public_key field should have var.ssh_key"
}

# Define provider digitalocean
deny[msg] {
    not input.provider
    msg = "No provider block provided"
}

deny[msg] {
    not input.provider.digitalocean
    msg = "Digitalocean not defined in provider block"
}

deny[msg] {
    not input.provider.digitalocean.token
    msg = "Digitalocean token should be defined"
}

deny[msg] {
    not contains(input.provider.digitalocean.token, "var.do_token")
    msg = "Digitalocean token should be equal to `var.do_token`"
}
