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

variable "template_os_family" {
  default = "linux"
}

module "virtual_machines" {
  source             = "../../"
  datacenter         = "${var.datacenter}"
  datastore          = "${var.datastore}"
  domain_name        = "${var.domain_name}"
  linked_clone       = "${var.linked_clone}"
  network            = "${var.network}"
  resource_pool      = "${var.resource_pool}"
  template_name      = "${var.template_name}"
  template_os_family = "${var.template_os_family}"
  vm_count           = "${var.vm_count}"
  vm_name_prefix     = "${var.vm_name_prefix}"
}
