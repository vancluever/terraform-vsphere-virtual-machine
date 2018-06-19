variable "datacenter" {
  type = "string"
}

variable "resource_pool" {
  type = "string"
}

variable "datastore" {
  type = "string"
}

variable "network" {
  type = "string"
}

variable "vm_name_prefix" {
  type = "string"
}

variable "vm_count" {
  type = "string"
}

variable "disk_size" {
  type = "string"
}

variable "guest_id" {
  type = "string"
}

variable "wait_for_guest_net_timeout" {
  type = "string"
}

variable "memory" {
  type = "string"
}

module "virtual_machines" {
  source                     = "../../"
  datacenter                 = "${var.datacenter}"
  datastore                  = "${var.datastore}"
  disk_size                  = "${var.disk_size}"
  guest_id                   = "${var.guest_id}"
  memory                     = "${var.memory}"
  network                    = "${var.network}"
  resource_pool              = "${var.resource_pool}"
  vm_count                   = "${var.vm_count}"
  vm_name_prefix             = "${var.vm_name_prefix}"
  wait_for_guest_net_timeout = "${var.wait_for_guest_net_timeout}"
}
