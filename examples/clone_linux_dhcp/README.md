# terraform-vsphere-virtual-machine Clone Example (Linux, DHCP)

This is a clone example for Linux virtual machines. The VM should be deployed to
a DHCP-capable network so that each VM boots with an IP address, as
`wait_for_guest_net_timeout` is left at its default in this example and
Terraform will wait for each VM to have a IP address that can be reported.

Note that the template supplied to `template_name` should be a Linux
distribution that is compatible with VMware tools, and VMware tools should be
installed on the template prior to use. As well, to use `linked_clone`, the VM
needs to have a single snapshot, best taken while the VM is powered down.
