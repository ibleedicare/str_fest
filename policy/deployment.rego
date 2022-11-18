package main

deny[msg] {
    image := input.resource.digitalocean_droplet[i].image
    not image == "debian-11-x64"
    msg = sprintf("Droplet is not debian 11 64bit", [i])
}

deny[msg] {
    region := input.resource.digitalocean_droplet[i].region
    not region == "fra1"
    msg = sprintf("Region for `%v` doesn't match fra1", [i])
}

deny[msg] {
    name := input.resource.digitalocean_droplet[i].name
    not name == "obs"
    msg = sprintf("Region for `%v` doesn't match obs", [i])
}

deny[msg] {
    size := input.resource.digitalocean_droplet[i].size
    not size == "s-1vcpu-1gb-amd"
    msg = sprintf("Size for `%v` doesn't match s-1vcpu-1gb-amd", [i])
}