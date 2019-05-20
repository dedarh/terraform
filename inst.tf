resource "yandex_compute_instance" "docker" {
  name = "docker"
  hostname = "docker"
  allow_stopping_for_update = true
  resources {
    cores  = 1
    memory = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      snapshot_id = "fd8bmsj901inmn4f8s4o"
      type = "network-nvme"
      size = "${var.size_disk_app}"
    }
  }
  network_interface {
    subnet_id = "${yandex_vpc_subnet.local.id}"
    nat       = true
  }
  metadata {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "consul" {
  name = "consul"
  hostname = "consul"
  allow_stopping_for_update = true
  resources {
    cores  = 1
    memory = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      snapshot_id = "fd8bmsj901inmn4f8s4o"
      type = "network-nvme"
      size = "${var.size_disk_app}"
    }
  }
  network_interface {
    subnet_id = "${yandex_vpc_subnet.local.id}"
    nat       = true
  }
  metadata {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "dockerslave" {
  name = "dockerslave"
  hostname = "dockerslave"
  allow_stopping_for_update = true
  resources {
    cores  = 1
    memory = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      snapshot_id = "fd8bmsj901inmn4f8s4o"
      type = "network-nvme"
      size = "${var.size_disk_app}"
    }
  }
  network_interface {
    subnet_id = "${yandex_vpc_subnet.local.id}"
    nat       = true
  }
  metadata {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "cocroachdb" {
  name = "cocroachdb"
  hostname = "cocroachdb"
  allow_stopping_for_update = true
  resources {
    cores  = 1
    memory = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      snapshot_id = "fd8bmsj901inmn4f8s4o"
      type = "network-nvme"
      size = "${var.size_disk_app}"
    }
  }
  network_interface {
    subnet_id = "${yandex_vpc_subnet.local.id}"
    nat       = true
  }
  metadata {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "jenkins" {
  name = "jenkins"
  hostname = "jenkins"
  allow_stopping_for_update = true
  resources {
    cores  = 1
    memory = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      snapshot_id = "fd8bmsj901inmn4f8s4o"
      type = "network-nvme"
      size = "${var.size_disk_app}"
    }
  }
  network_interface {
    subnet_id = "${yandex_vpc_subnet.local.id}"
    nat       = true
  }
  metadata {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}




data "template_file" "policy" {
  template = "${file("${path.module}/hosts_template")}"
  vars {
    docker = "${yandex_compute_instance.docker.network_interface.0.nat_ip_address}"
    docker_slave = "${yandex_compute_instance.dockerslave.network_interface.0.nat_ip_address}"
    consul = "${yandex_compute_instance.consul.network_interface.0.nat_ip_address}"
    jenkins = "${yandex_compute_instance.jenkins.network_interface.0.nat_ip_address}"
    cocroachdb = "${yandex_compute_instance.cocroachdb.network_interface.0.nat_ip_address}"
  }
}

resource "local_file" "render" {
    content     = "${data.template_file.policy.rendered}"
    filename = "${path.module}/hosts"
}





