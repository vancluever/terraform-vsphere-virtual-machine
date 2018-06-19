# terraform-vsphere-virtual-machine

Module `terraform-vsphere-virtual-machine` is a universal module that can be
used to deploy vSphere virtual machines either from scratch, or from a
Windows or Linux-based template.

This makes use of the following resources and data sources within the
[Terraform vSphere provider][vsphere-provider]:

* [`vsphere_virtual_machine`][virtual-machine-resource]
* [`vsphere_datacenter`][datacenter-data-source]
* [`vsphere_resource_pool`][resource-pool-data-source]
* [`vsphere_datastore`][datastore-data-source]
* [`vsphere_virtual_machine` (Data Source)][virtual-machine-data-source]

In order to use this module, ensure that you have configured the vSphere
provider as per the instructions seen [here][vsphere-provider].

[vsphere-provider]: https://www.terraform.io/docs/providers/vsphere/index.html
[virtual-machine-resource]: https://www.terraform.io/docs/providers/vsphere/r/virtual_machine.html
[virtual-machine-data-source]: https://www.terraform.io/docs/providers/vsphere/d/virtual_machine.html
[datacenter-data-source]: https://www.terraform.io/docs/providers/vsphere/d/datacenter.html
[resource-pool-data-source]: https://www.terraform.io/docs/providers/vsphere/d/resource_pool.html
[datastore-data-source]: https://www.terraform.io/docs/providers/vsphere/d/datastore.html

Usage Example:

    module "virtual_machines" {
      source                     = "vancluever/terraform-vsphere-virtual-machine"
      version                    = "1.0.0"
      datacenter                 = "dc1"
      datastore                  = "datastore1"
      disk_size                  = "10"
      guest_id                   = "otherLinuxGuest"
      memory                     = "2048"
      network                    = "network1"
      resource_pool              = "cluster1/Resources"
      vm_count                   = "3"
      vm_name_prefix             = "srv"
    }



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin_password | The administrator password for Windows machines. This is a sensitive field and will not be output on-screen, but is stored in state and sent to the VM in plain text - keep this in mind when provisioning your infrastructure. | string | `` | no |
| alternate_guest_name | The guest name for the operating system when guest_id is other or other-64. Leave blank if not using these guest IDs. | string | `` | no |
| datacenter | The datacenter to deploy the virtual machines to. | string | - | yes |
| datastore | The datastore to deploy the virtual machines to. | string | - | yes |
| disk_size | The amount of disk space to assign to each VM. Leave blank to use the template's disk size (cloned VMs only). | string | `` | no |
| dns_servers | The DNS servers to assign to each virtual machine. | string | `<list>` | no |
| domain_name | The domain of the virtual machine. This is added as the domain name on Linux, and to the DNS domain search list on both Linux and Windows. | string | `` | no |
| guest_id | The virtual machine type. This only applies to VMs being created from scratch, otherwise it is unused. | string | `` | no |
| ipv4_address_start | The IP address to start assigning virtual machines at, relative to the network address and mask. Example: for two virtual machines in 10.0.0.0/24, a value of 10 here would give the IP addresses 10.0.0.10 and 10.0.0.11. For 10.0.0.128/25, a value of 10 would give 10.0.0.138 and 10.0.0.139. | string | `1` | no |
| ipv4_gateway | The default IPv4 gateway for the virtual machines. Leave blank for DHCP. | string | `` | no |
| ipv4_network_address | The network address to assign during customization of cloned virtual machines, in A.B.C.D/XX format. Leave at the default value for DHCP. | string | `0.0.0.0/0` | no |
| linked_clone | Clone the VM from a snapshot. If selected, the VM must have a single snapshot created. Cloned VMs only. | string | `false` | no |
| memory | The amount of memory, in MB, to assign each virtual machine. | string | `1024` | no |
| network | The network to deploy virtual machines to. | string | - | yes |
| num_cpus | The number of virtual CPUs to assign each virtual machine. | string | `2` | no |
| resource_pool | The resource pool to deploy the virtual machines to. If specifying a the root resource pool of a cluster, enter CLUSTER_NAME/Resources. | string | - | yes |
| template_name | The template to clone virtual machines from. Leave this blank when creating a virtual machine from scratch. | string | `` | no |
| template_os_family | The OS family of the supplied template. Should be one of linux or windows. Leave blank to create a virtual machine from scratch. | string | `` | no |
| time_zone | The timezone, either in a timezone database format entry or sysprep entry, depending on if Linux or Windows is being deployed. The default is UTC on both family types. | string | `` | no |
| vm_count | The number of virtual machines to create. | string | `1` | no |
| vm_name_prefix | The prefix to use for virtual machines created with this module. | string | - | yes |
| wait_for_guest_net_timeout | The timeout, in mintues, to wait for the guest network when creating virtual machines. On virtual machines created from scratch, you may wish to adjust this value to -1, which will disable the waiter. | string | `5` | no |
| workgroup | The workgroup name for Windows customization. | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| virtual_machine_default_ips | The default IP address of each virtual machine deployed, indexed by name. |
| virtual_machine_ids | The ID of each virtual machine deployed, indexed by name. |
| virtual_machine_names | The names of each virtual machine deployed. |

