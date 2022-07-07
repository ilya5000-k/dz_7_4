
output "zone" {
  value = yandex_vpc_subnet.default.zone
}

output "subnet_id" {
  value = {
    for server in yandex_compute_instance.node :
    server.name => server.network_interface.0.subnet_id
  }
}

output "s_id" {
  value = yandex_vpc_subnet.default.id
}

output "internal_ip_address_node01_yandex_cloud" {
  value = {
    for server in yandex_compute_instance.node :
    server.name => server.network_interface.0.ip_address
  }
}


output "external_ip_address_node01_yandex_cloud" {
  value = {
    for server in yandex_compute_instance.node :
    server.name => server.network_interface.0.nat_ip_address
  }
}

output "internal_ip_address_node_for_each_yandex_cloud" {
  value = {
    for server in yandex_compute_instance.node_for_each :
    server.name => server.network_interface.0.ip_address
  }
}


output "external_ip_address_node_for_each_yandex_cloud" {
  value = {
    for server in yandex_compute_instance.node_for_each :
    server.name => server.network_interface.0.nat_ip_address
  }
}


output "tf_workspace" {
  value = "${terraform.workspace}"
}
