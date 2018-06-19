/**
 * # terraform-vsphere-virtual-machine
 * 
 * Module `terraform-vsphere-virtual-machine` is a universal module that can be
 * used to deploy vSphere virtual machines either from scratch, or from a
 * Windows or Linux-based template.
 * 
 * This makes use of the following resources and data sources within the
 * [Terraform vSphere provider][vsphere-provider]:
 * 
 * * [`vsphere_virtual_machine`][virtual-machine-resource]
 * * [`vsphere_datacenter`][datacenter-data-source]
 * * [`vsphere_resource_pool`][resource-pool-data-source]
 * * [`vsphere_datastore`][datastore-data-source]
 * * [`vsphere_virtual_machine` (Data Source)][virtual-machine-data-source]
 * 
 * In order to use this module, ensure that you have configured the vSphere
 * provider as per the instructions seen [here][vsphere-provider].
 * 
 * [vsphere-provider]: https://www.terraform.io/docs/providers/vsphere/index.html
 * [virtual-machine-resource]: https://www.terraform.io/docs/providers/vsphere/r/virtual_machine.html
 * [virtual-machine-data-source]: https://www.terraform.io/docs/providers/vsphere/d/virtual_machine.html
 * [datacenter-data-source]: https://www.terraform.io/docs/providers/vsphere/d/datacenter.html
 * [resource-pool-data-source]: https://www.terraform.io/docs/providers/vsphere/d/resource_pool.html
 * [datastore-data-source]: https://www.terraform.io/docs/providers/vsphere/d/datastore.html
 * 
 * Usage Example:
 * 
 *     module "virtual_machines" {
 *       source                     = "vancluever/terraform-vsphere-virtual-machine"
 *       version                    = "1.0.0"
 *       datacenter                 = "dc1"
 *       datastore                  = "datastore1"
 *       disk_size                  = "10"
 *       guest_id                   = "otherLinuxGuest"
 *       memory                     = "2048"
 *       network                    = "network1"
 *       resource_pool              = "cluster1/Resources"
 *       vm_count                   = "3"
 *       vm_name_prefix             = "srv"
 *     }
 * 
 */

