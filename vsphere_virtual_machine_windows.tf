resource "vsphere_virtual_machine" "virtual_machine_windows" {
  count            = "${var.template_os_family == "windows" ? var.vm_count : 0}"
  name             = "${var.vm_name_prefix}-${var.vm_count == 1 ? "" : "${count.index}"}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.ds.id}"

  num_cpus = "${var.num_cpus}"
  memory   = "${var.memory}"
  folder   = "${var.folder}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  wait_for_guest_net_timeout = "${var.wait_for_guest_net_timeout}"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label            = "disk0"
    size             = "${var.disk_size != "" ? var.disk_size : data.vsphere_virtual_machine.template.disks.0.size}"
    thin_provisioned = "${var.linked_clone == "true" ? data.vsphere_virtual_machine.template.disks.0.thin_provisioned : true}"
    eagerly_scrub    = "${var.linked_clone == "true" ? data.vsphere_virtual_machine.template.disks.0.eagerly_scrub: false}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    linked_clone  = "${var.linked_clone}"

    customize {
      windows_options {
        computer_name  = "${var.vm_name_prefix}-${var.vm_count == 1 ? "" : "${count.index}"}"
        admin_password = "${var.admin_password}"
        workgroup      = "${var.workgroup}"
        time_zone      = "${var.time_zone != "" ? var.time_zone : "85"}"
      }

      network_interface {
        ipv4_address    = "${var.ipv4_network_address != "0.0.0.0/0" ? cidrhost(var.ipv4_network_address, var.ipv4_address_start + count.index) : ""}"
        ipv4_netmask    = "${var.ipv4_network_address != "0.0.0.0/0" ? element(split("/", var.ipv4_network_address), 1) : 0}"
        dns_server_list = ["${var.dns_servers}"]
        dns_domain      = "${var.domain_name}"
      }

      ipv4_gateway = "${var.ipv4_gateway}"
    }
  }
}
