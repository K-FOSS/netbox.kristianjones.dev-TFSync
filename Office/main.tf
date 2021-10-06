terraform {
  required_providers {
    #
    # Netbox
    #
    # Docs: https://registry.terraform.io/providers/e-breuninger/netbox/latest/docs
    #
    netbox = {
      source = "e-breuninger/netbox"
      version = "0.2.4"
    }

    #
    # Netbox IPAM
    #
    # Docs: https://registry.terraform.io/providers/tle06/netbox/latest/docs
    #
    ipam = {
      source = "smutel/netbox"
      version = "2.0.2"
    }
  }
}

#
# Site
#
resource "ipam_ipam_vlan_group" "Site" {
  name = var.Name
  slug = "${var.Region.slug}site1"
}

#
# Spine VLAN
#
resource "ipam_ipam_vlan" "vlan_test" {
  vlan_id = 100
  name = "TestVlan"

  site_id = netbox_ipam_vlan_group.Site.site_id
  description = "VLAN created by terraform"
  vlan_group_id = netbox_ipam_vlan_group.Site.id
}

#
# Spine Network
#


