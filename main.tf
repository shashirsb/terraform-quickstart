provider "oci" {

  region  = "us-ashburn-1"

}


module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
}



