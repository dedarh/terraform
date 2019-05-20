output "docker_ip_address_private" {
  value = "${yandex_compute_instance.docker.network_interface.0.ip_address}"
}

output "docker_ip_address_public" {
  value = "${yandex_compute_instance.docker.network_interface.0.nat_ip_address}"
}

output "consul_ip_address_private" {
  value = "${yandex_compute_instance.consul.network_interface.0.ip_address}"
}

output "consul_ip_address_public" {
  value = "${yandex_compute_instance.consul.network_interface.0.nat_ip_address}"
}
output "dockerslave_ip_address_private" {
  value = "${yandex_compute_instance.dockerslave.network_interface.0.ip_address}"
}

output "dockerslave_ip_address_public" {
  value = "${yandex_compute_instance.dockerslave.network_interface.0.nat_ip_address}"
}

output "cocroachdb_ip_address_private" {
  value = "${yandex_compute_instance.cocroachdb.network_interface.0.ip_address}"
}

output "cocroachdb_ip_address_public" {
  value = "${yandex_compute_instance.cocroachdb.network_interface.0.nat_ip_address}"
}
output "jenkins_ip_address_private" {
  value = "${yandex_compute_instance.jenkins.network_interface.0.ip_address}"
}

output "jenkins_ip_address_public" {
  value = "${yandex_compute_instance.jenkins.network_interface.0.nat_ip_address}"
}
