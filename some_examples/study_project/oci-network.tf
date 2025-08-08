resource "oci_core_virtual_network" "bifrost" {
  compartment_id = oci_identity_compartment.valhalla.id
  cidr_block     = "10.0.0.0/16" # Substitua pelo bloco de endereços desejado
  display_name   = "bifrost"
}

resource "oci_core_internet_gateway" "bifrost_internet_gateway" {
  compartment_id = oci_identity_compartment.valhalla.id
  vcn_id         = oci_core_virtual_network.bifrost.id
  display_name   = "bifrost_internet_gateway"
}

resource "oci_core_subnet" "asgard" {
  compartment_id             = oci_identity_compartment.valhalla.id
  vcn_id                     = oci_core_virtual_network.bifrost.id
  cidr_block                 = "10.0.1.0/24" # Substitua pelo bloco de endereços desejado para a sub-rede pública
  display_name               = "asgard"
  prohibit_public_ip_on_vnic = false # Permitir IPs públicos nas instâncias
  security_list_ids          = [oci_core_security_list.heimdall.id]
  route_table_id             = oci_core_route_table.PublicRouteTable.id
}

resource "oci_core_route_table" "PublicRouteTable" {
  compartment_id = oci_identity_compartment.valhalla.id
  vcn_id         = oci_core_virtual_network.bifrost.id
  display_name   = "PublicRouteTable"

  route_rules {
    destination     = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.bifrost_internet_gateway.id # Associar com o gateway de internet
  }
}


resource "oci_core_security_list" "heimdall" {
    #Required
    compartment_id = oci_identity_compartment.valhalla.id
    vcn_id = oci_core_virtual_network.bifrost.id

    #Optional
        freeform_tags = {
        "Created_with"= "Terraform"
        "Environment"= "Development"
        }
    display_name = "heimdall"

    egress_security_rules {
        #Required
        destination = "0.0.0.0/0"
        protocol = "all"
    }
    ingress_security_rules {
        #Required
        protocol = 6
        source = var.my_public_ip

        #Optional
        description = "enable SSH"
        source_type = "CIDR_BLOCK"
        tcp_options {
            max = 22
            min = 22
        }
    }
    ingress_security_rules {
        #Required
        protocol = 6
        source = var.my_public_ip

        #Optional
        description = "enable MYSQL"
        source_type = "CIDR_BLOCK"
        tcp_options {
            max = 3306
            min = 3306
        }
    }

}
