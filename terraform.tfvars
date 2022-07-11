compartment_id = "ocid1.compartment.oc1..aaaaaaaah6ibn4qjy6chh7ilzha53oeeacmrmghdh5ziqhzn2xtgubhxolga"
vcn_cidrs     = ["10.2.0.0/16"]
vcn_display_name = "appdev-workshop-vcn"

subnets = {
  bastion  = { netnum = 0, newbits = 14 }
}

vcn_id       = module.vcn.vcn_id
