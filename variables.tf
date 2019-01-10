variable "datacenter" {
  type        = "string"
  description = "The datacenter to deploy the virtual machines to."
}

variable "resource_pool" {
  description = "The resource pool to deploy the virtual machines to. If specifying a the root resource pool of a cluster, enter CLUSTER_NAME/Resources."
}

variable "datastore" {
  type        = "string"
  description = "The datastore to deploy the virtual machines to."
}

variable "network" {
  type        = "string"
  description = "The network to deploy virtual machines to."
}

variable "vm_name_prefix" {
  type        = "string"
  description = "The prefix to use for virtual machines created with this module."
}

variable "vm_count" {
  description = "The number of virtual machines to create."
  default     = "1"
}

variable "template_os_family" {
  description = "The OS family of the supplied template. Should be one of linux or windows. Leave blank to create a virtual machine from scratch."
  default     = ""
}

variable "template_name" {
  description = "The template to clone virtual machines from. Leave this blank when creating a virtual machine from scratch."
  default     = ""
}

variable "num_cpus" {
  description = "The number of virtual CPUs to assign each virtual machine."
  default     = "2"
}

variable "memory" {
  description = "The amount of memory, in MB, to assign each virtual machine."
  default     = "1024"
}

variable "folder" {
  description = "The path to the folder to put this virtual machine in, relative to the datacenter that the resource pool is in."
}

variable "disk_size" {
  description = "The amount of disk space to assign to each VM. Leave blank to use the template's disk size (cloned VMs only)."
  default     = ""
}

variable "guest_id" {
  description = "The virtual machine type. This only applies to VMs being created from scratch, otherwise it is unused."
  default     = ""
}

variable "alternate_guest_name" {
  description = "The guest name for the operating system when guest_id is other or other-64. Leave blank if not using these guest IDs."
  default     = ""
}

variable "wait_for_guest_net_timeout" {
  description = "The timeout, in mintues, to wait for the guest network when creating virtual machines. On virtual machines created from scratch, you may wish to adjust this value to -1, which will disable the waiter."
  default     = "5"
}

variable "linked_clone" {
  description = "Clone the VM from a snapshot. If selected, the VM must have a single snapshot created. Cloned VMs only."
  default     = "false"
}

variable "domain_name" {
  description = "The domain of the virtual machine. This is added as the domain name on Linux, and to the DNS domain search list on both Linux and Windows."
  default     = ""
}

variable "ipv4_network_address" {
  description = "The network address to assign during customization of cloned virtual machines, in A.B.C.D/XX format. Leave at the default value for DHCP."
  default     = "0.0.0.0/0"
}

variable "ipv4_address_start" {
  description = "The IP address to start assigning virtual machines at, relative to the network address and mask. Example: for two virtual machines in 10.0.0.0/24, a value of 10 here would give the IP addresses 10.0.0.10 and 10.0.0.11. For 10.0.0.128/25, a value of 10 would give 10.0.0.138 and 10.0.0.139."
  default     = "1"
}

variable "ipv4_gateway" {
  description = "The default IPv4 gateway for the virtual machines. Leave blank for DHCP."
  default     = ""
}

variable "dns_servers" {
  description = "The DNS servers to assign to each virtual machine."
  default     = []
}

variable "time_zone" {
  description = "The timezone, either in a timezone database format entry or sysprep entry, depending on if Linux or Windows is being deployed. The default is UTC on both family types."
  default     = ""
}

variable "workgroup" {
  description = "The workgroup name for Windows customization."
  default     = ""
}

variable "admin_password" {
  description = "The administrator password for Windows machines. This is a sensitive field and will not be output on-screen, but is stored in state and sent to the VM in plain text - keep this in mind when provisioning your infrastructure."
  default     = ""
}
