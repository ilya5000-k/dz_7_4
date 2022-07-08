locals {
  instance_count_for_each = {
    stage = ["vm-1"]
    prod = ["vm-1", "vm-2"]
      }
}


# qqq
resource "yandex_compute_instance" "node_for_each" {
for_each   =  toset(local.instance_count_for_each[terraform.workspace])
  name       = "node-for-each-${each.value}-${terraform.workspace}"
  zone                      = "ru-central1-a"
  hostname                  = "node-for-each-${each.value}-${terraform.workspace}.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.centos-7-base}"
      name        = "root-node-${each.key}"
      type        = "network-nvme"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.default.id}"
    nat       = true
  }

    
  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
# description = "node_for_each_${terraform.workspace}"


lifecycle {
    create_before_destroy = true

  }
  
}
