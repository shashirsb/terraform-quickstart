provider "oci" {
  region  = "us-ashburn-1"
}


module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
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
  value       = oci_core_vcn.appdev_vcn.vcn_id
}


