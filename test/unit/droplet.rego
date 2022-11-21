package main

deny[msg] {
    not input.resource.digitalocean_droplet.obs
    msg = "Define droplet resource"
}

deny[msg] {
    not input.resource.digitalocean_droplet.obs.image
    msg = "Droplet should have an image defined"
}
