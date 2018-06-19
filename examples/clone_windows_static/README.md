# terraform-vsphere-virtual-machine Clone Example (Windows, Static)

This is a clone example for Windows virtual machines, using static IP
addressing.

Pay special attention to the values you assign to `ipv4_network_address` and
`ipv4_address_start`. The last is the _offset_ to which IP addresses should be
started at. As documented within the module, this has implications depending on
how you divide your networks. 

Using this with a /24 is very straightforward: given an network such as
10.0.0.0/24, an `ipv4_address_start` value of 10 would literally mean your IP
addresses start at 10.0.0.10. However, using this with a network that does not
start at the typical class A, B, or C boundaries is a little more complicated -
as an example, for 10.0.0.128/25, an `ipv4_address_start` value of 10 means that
your IP addresses start at 10.0.0.138.

Note that the template supplied to `template_name` should be a Windows
distribution that is compatible with VMware tools, and VMware tools should be
installed on the template prior to use. As well, to use `linked_clone`, the VM
needs to have a single snapshot, best taken while the VM is powered down.

Finally, note that the password you enter into `admin_password` is stored in
plain text in Terraform state. Plan accordingly!
