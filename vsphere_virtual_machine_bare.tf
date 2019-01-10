resource "vsphere_virtual_machine" "virtual_machine_bare" {
  count            = "${var.template_os_family == "" ? var.vm_count : 0}"
  name             = "${var.vm_name_prefix}-${var.vm_count == 1 ? "" : "${count.index}"}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.ds.id}"

  num_cpus = "${var.num_cpus}"
  memory   = "${var.memory}"
  folder   = "${var.folder}"
  guest_id = "${var.guest_id}"

  wait_for_guest_net_timeout = "${var.wait_for_guest_net_timeout}"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = "${var.disk_size}"
  }
}

# vim: filetype=terraform

