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
    cidr_block = "10.2.0.0/16"    
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
  subnets        = var.subnets
  vcn_id         = module.vcn.vcn_id
  vcn_cidrs      = var.vcn_cidrs



  depends_on = [
    module.vcn
  ]
}
