variable "oci_region" {
  type    = string
  default = "us-ashburn-1"
}

variable "oci_tenancy_ocid" {
  type    = string
  default = "ocid1.tenancy.oc1..aaaaaaaa33ddha4bf5a7cfdi24motxqdnb4fxx3pd2imju5xzrihiynyxvqq"
}

variable "oci_user_ocid" {
  type    = string
  default = "ocid1.user.oc1..aaaaaaaabzmd25kf3xh5khj4r535ufob244sgiyn2kvcwlf7unta2hjeofsq"
}

variable "oci_fingerprint" {
  type    = string
  default = ""
}

variable "oci_private_key_path" {
  type    = string
  default = ""
}

variable "oci_root_compartment_id" {
  type    = string
  default = "ocid1.tenancy.oc1..aaaaaaaa33ddha4bf5a7cfdi24motxqdnb4fxx3pd2imju5xzrihiynyxvqq"
}

variable "oci_public_ssh_key" {
  type    = string
  default = ""
}

variable "my_public_ip" {
  type    = string
  default = "177.76.33.202/32"
}

variable "oci_ubuntu_image" {
  type    = string
  default = "ocid1.image.oc1.iad.aaaaaaaahurkvznjb2xozs3vteeg7goqq7r2zfna2tnqau37f2bydnbkboka"
}

variable "oci_ubuntu_arm_image" {
  type    = string
  default = "ocid1.image.oc1.iad.aaaaaaaai42i6avvfxqawj3bjl5uzhlyq5lqkqhbeg4lpo5corvwqgnvrloq"
}



variable "oci_rocky_image" {
  type    = string
  default = "ocid1.image.oc1..aaaaaaaa7fil4t3bbhs2k3gkhiaaaaafe2y4i4h4r4v5jo7uznsrwszk3vaq"
}