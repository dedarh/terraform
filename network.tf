resource "yandex_vpc_network" "test" {
  name = "test"
}

resource "yandex_vpc_subnet" "local" {
  name           = "local"
  zone           = "${var.ya-zone}"
  network_id     = "${yandex_vpc_network.test.id}"
  v4_cidr_blocks = ["192.168.10.0/24"]
}
