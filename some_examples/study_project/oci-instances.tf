resource "oci_core_instance" "mimir" {

	availability_domain = "cWAI:US-ASHBURN-AD-1"
	compartment_id = oci_identity_compartment.valhalla.id
	create_vnic_details {
		assign_public_ip = "true"
		subnet_id = oci_core_subnet.asgard.id
 	}
	display_name = "mimir"
	metadata = {
		"ssh_authorized_keys" = var.oci_public_ssh_key
	}
	shape = "VM.Standard.E2.1.Micro"
	source_details {
		source_id = var.oci_rocky_image
		source_type = "image"
	}
}

output "mimir_public_ip" {
  value = oci_core_instance.mimir.public_ip
}

#resource "oci_core_instance" "freya" {
#
#	availability_domain = "cWAI:US-ASHBURN-AD-1"
#	compartment_id = oci_identity_compartment.valhalla.id
#	create_vnic_details {
#		assign_public_ip = "true"
#		subnet_id = oci_core_subnet.asgard.id
# 	}
#	display_name = "freya"
#	metadata = {
#		"ssh_authorized_keys" = var.oci_public_ssh_key
#	}
#	shape = "VM.Standard.E2.1.Micro"
#	source_details {
#		source_id = var.oci_ubuntu_image
#		source_type = "image"
#	}
#}
#
#output "freya_public_ip" {
#  value = oci_core_instance.freya.public_ip
#}

resource "oci_core_instance" "magni" {

	availability_domain = "cWAI:US-ASHBURN-AD-1"
	compartment_id = oci_identity_compartment.valhalla.id
	create_vnic_details {
		assign_public_ip = "true"
		subnet_id = oci_core_subnet.asgard.id
 	}

	display_name = "magni"
	metadata = {
		"ssh_authorized_keys" = var.oci_public_ssh_key
	}
	shape = "VM.Standard.A1.Flex"
	shape_config {
		memory_in_gbs = "24"
		ocpus = "4"
	}
	source_details {
		source_id = var.oci_ubuntu_arm_image
		source_type = "image"
	}
}

output "magni_public_ip" {
  value = oci_core_instance.magni.public_ip
}