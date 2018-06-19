output "virtual_machine_names" {
  description = "The names of each virtual machine deployed."

  value = ["${flatten(list(
    vsphere_virtual_machine.virtual_machine_bare.*.name,
    vsphere_virtual_machine.virtual_machine_linux.*.name,
    vsphere_virtual_machine.virtual_machine_windows.*.name,
  ))}"]
}

output "virtual_machine_ids" {
  description = "The ID of each virtual machine deployed, indexed by name."

  value = "${zipmap(
    flatten(list(
      vsphere_virtual_machine.virtual_machine_bare.*.name,
      vsphere_virtual_machine.virtual_machine_linux.*.name,
      vsphere_virtual_machine.virtual_machine_windows.*.name,
    )),
    flatten(list(
      vsphere_virtual_machine.virtual_machine_bare.*.id,
      vsphere_virtual_machine.virtual_machine_linux.*.id,
      vsphere_virtual_machine.virtual_machine_windows.*.id,
    )),
  )}"
}

output "virtual_machine_default_ips" {
  description = "The default IP address of each virtual machine deployed, indexed by name."

  value = "${zipmap(
    flatten(list(
      vsphere_virtual_machine.virtual_machine_bare.*.name,
      vsphere_virtual_machine.virtual_machine_linux.*.name,
      vsphere_virtual_machine.virtual_machine_windows.*.name,
    )),
    flatten(list(
      vsphere_virtual_machine.virtual_machine_bare.*.default_ip_address,
      vsphere_virtual_machine.virtual_machine_linux.*.default_ip_address,
      vsphere_virtual_machine.virtual_machine_windows.*.default_ip_address,
    )),
  )}"
}
