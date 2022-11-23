output "public_ip" {
	value = digitalocean_droplet.obs.ipv4_address
}