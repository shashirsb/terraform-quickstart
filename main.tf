provider "oci" {

  region  = "us-ashburn-1"

}


module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
}

module "compute-instance" {
  source  = "oracle-terraform-modules/compute-instance/oci"
}

