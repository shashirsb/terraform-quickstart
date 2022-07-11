resource "oci_core_subnet" "bastion" {
  
  #Required
  cidr_block                 = local.bastion_subnet
  compartment_id             = var.compartment_id
  vcn_id                     = var.vcn_id
 
  #Optional
  prohibit_public_ip_on_vnic = false  
}