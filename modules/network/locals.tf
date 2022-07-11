locals {

  # first vcn cidr
  # pick the first cidr block in the list as this is where we will create the bastion subnets
  vcn_cidr = element(var.vcn_cidrs, 0)

  # subnet cidrs - used by subnets
  bastion_subnet = cidrsubnet(local.vcn_cidr, lookup(var.subnets["bastion"], "newbits"), lookup(var.subnets["bastion"], "netnum"))

}