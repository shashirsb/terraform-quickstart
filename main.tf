provider "oci" {
  region  = "us-ashburn-1"
}


module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  compartment_id = var.compartment_id
}


resource "oci_core_vcn" "appdev_vcn" {
    #Required
    compartment_id = var.compartment_id

    #Optional   
    cidr_block = var.vcn_cidr_block    
    display_name = var.vcn_display_name
   
}

output "vcn_id" {
  description = "VCN id details"
  value       = oci_core_vcn.appdev_vcn.id
}

# additional networking for oke
module "network" {
  source = "./modules/network"

  # general oci parameters
  compartment_id = var.compartment_id
  subnets      = var.subnets
  vcn_id       = var.vcn_id
  vcn_cidrs    = var.vcn_cidr_block

  

  depends_on = [
    module.vcn
  ]
}
