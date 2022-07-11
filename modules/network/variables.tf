# General OCI parameters
variable "compartment_id" {
  description = "The compartment id where to create all resources."
  type        = string
}

variable "vcn_id" {
  description = "vcn string containing ocid."
  type        = string
}


variable "subnets" {
  description = "parameters to cidrsubnet function to calculate subnet masks within the VCN."
  type = map(any)
}



variable "vcn_cidrs" {
  description = "The list of IPv4 CIDR blocks the VCN will use."
  type        = list(string)
}