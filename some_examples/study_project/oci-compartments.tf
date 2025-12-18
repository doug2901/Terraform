resource "oci_identity_compartment" "valhalla" {
  #Required
  compartment_id = var.oci_root_compartment_id
  description    = "Ragnarok"
  name           = "valhalla"

  freeform_tags = {
    "Created_with" = "Terraform"
    "Environment"  = "Development"
  }

}