# terraform-vsphere-virtual-machine Creation Example

This is an example of creating a virtual machine from scratch. We sometimes
refer to this as the "bare metal" example as a virtual machine is not being
created from a cloned template.

Creating virtual machines from scratch does not necessarily synergize 100% with
Terraform's principles, but can definitely serve a role. The most ideal scenario
that applies to this module specifically is if you are netbooting virtual
machines using a PXE server, either as an install method or as a fully-fledged
"diskless"(\*) deployment method. We test the latter scenario with
[RancherOS][rancher-os], which will automatically detect that it's running in a
VMware virtual machine, and download VMware tools, ensuring that the OS boots
with its IP addresses fully reported in vSphere.

[rancher-os]: https://rancher.com/docs/os/v1.x/en/

If you are interested in the RancherOS install method, check
[here][rancher-os-ipxe] for instructions on how to use Rancher with iPXE. Note
that Rancher requires that a virtual machine have at least 2 GB of RAM in order
to boot.

[rancher-os-ipxe]: https://rancher.com/docs/os/v1.x/en/installation/running-rancheros/server/pxe/

\*: *Diskless VMs are not currently possible with the vSphere provider -
"diskless" is used here as a way of referring to the method of deploying an
entire operating system installation completely from a PXE server, versus only
using it as an installation method.*
