package main

deny[msg] {
    not input.terraform
    msg = "Terraform block is missing"
}

deny[msg] {
    not input.terraform.required_providers
    msg = "required_providers block is missing"
}

# Digitalocean providers
deny[msg] {
    not input.terraform.required_providers.digitalocean
    msg = "Digitalocean provider is missing"
}

deny[msg] {
    not input.terraform.required_providers.digitalocean.source
    msg = "Digitalocean source field is mising"
}

deny[msg] {
    source := input.terraform.required_providers.digitalocean.source
    not source == "digitalocean/digitalocean"
    msg = "Digitalocean source mising"
}

deny[msg] {
    not input.terraform.required_providers.digitalocean.version
    msg = "Digitalocean version field is mising"
}

deny[msg] {
    version := input.terraform.required_providers.digitalocean.version
    not version == "~> 2.0"
    msg = "Digitalocean version mising should be ~> 2.0"
}
