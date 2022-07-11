provider "oci" {
  region  = "us-ashburn-1"
}


module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  compartment_id = var.compartment_id
   vcn_cidrs  = var.vcn_cidrs
   vcn_name = var.vcn_display_name
}



output "vcn_id" {
  description = "VCN id details"
  value       = module.vcn.vcn_id
}

# additional networking for oke
module "network" {
  source = "./modules/network"

  # general oci parameters
  compartment_id = var.compartment_id
  subnets        = var.subnets
  vcn_id         = module.vcn.vcn_id

  depends_on = [
    module.vcn
  ]
}
