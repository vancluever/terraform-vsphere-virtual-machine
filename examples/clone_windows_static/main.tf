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

variable "template_name" {
  type = "string"
}

variable "linked_clone" {
  type = "string"
}

variable "domain_name" {
  type = "string"
}

variable "workgroup" {
  type = "string"
}

variable "admin_password" {
  type = "string"
}

variable "ipv4_network_address" {
  type = "string"
}

variable "ipv4_address_start" {
  type = "string"
}

variable "ipv4_gateway" {
  type = "string"
}

variable "dns_servers" {
  type = "list"
}

variable "memory" {
  type = "string"
}

variable "template_os_family" {
  default = "windows"
}

module "virtual_machines" {
  source               = "../../"
  admin_password       = "${var.admin_password}"
  datacenter           = "${var.datacenter}"
  datastore            = "${var.datastore}"
  dns_servers          = ["${var.dns_servers}"]
  domain_name          = "${var.domain_name}"
  ipv4_address_start   = "${var.ipv4_address_start}"
  ipv4_gateway         = "${var.ipv4_gateway}"
  ipv4_network_address = "${var.ipv4_network_address}"
  linked_clone         = "${var.linked_clone}"
  memory               = "${var.memory}"
  network              = "${var.network}"
  resource_pool        = "${var.resource_pool}"
  template_name        = "${var.template_name}"
  template_os_family   = "${var.template_os_family}"
  vm_count             = "${var.vm_count}"
  vm_name_prefix       = "${var.vm_name_prefix}"
  workgroup            = "${var.workgroup}"
}

output "virtual_machine_names" {
  value = "${module.virtual_machines.virtual_machine_names}"
}

output "virtual_machine_ids" {
  value = "${module.virtual_machines.virtual_machine_ids}"
}

output "virtual_machine_default_ips" {
  value = "${module.virtual_machines.virtual_machine_default_ips}"
}
