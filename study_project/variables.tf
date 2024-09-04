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
  default = "40:09:91:81:5a:07:0c:18:ea:47:0f:38:30:16:08:be"
}

variable "oci_private_key_path" {
  type    = string
  default = "E:\\OneDrive\\Study\\Cloud\\oci\\terraform\\terraform.pem"
}

variable "oci_root_compartment_id" {
  type    = string
  default = "ocid1.tenancy.oc1..aaaaaaaa33ddha4bf5a7cfdi24motxqdnb4fxx3pd2imju5xzrihiynyxvqq"
}

variable "oci_public_ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8TeteWxq/lkAWSusHgbK2s0ccpw4eifD27IdDhtBFYw62+uBV/rtT3/u5tfo34vadSKLWTrKPsqru4PmqVRayWjGurdhTYYgLFKf8TcG0o7EaplcENghoiZpHcoh8dGRhPvJHpfljP+d/USSUZDVtBD1FM55KEy03vVLy4blAL/vj5K0hOvs2pmiRPkk+rof9O7RyYhC2+9aVaf4Ch29dr/ddfdUjNxuc6kVlfjqPIWWwqcTx5QfQZNYMhAN8YClMvI+/05R2YGdjqbcB/WV3DdRXj9pXPYmFaW4CkGOFmaOiYebcYVr6XSSE8w+acr8WLBmwIY9lxMbanWFjIIo9 ssh-key-2023-09-13"
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