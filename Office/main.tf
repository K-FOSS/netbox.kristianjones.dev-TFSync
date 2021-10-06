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

      configuration_aliases = [ ipam.ipam ]
    }

    #
    # Netbox IPAM
    #
    # Docs: https://registry.terraform.io/providers/tle06/netbox/latest/docs
    #
    sites = {
      source = "tle06/netbox"
      version = "0.1.0-alpha.7"

      configuration_aliases = [ sites.sites ]
    }
  }
}

#
# Site
#
resource "netbox_dcim_site" "Site" {
  provider = sites.sites

  name = var.Name
  slug = "${var.Region.slug}site1"

  region_id = var.Region.id
}

#
# Spine VLAN
#
resource "netbox_ipam_vlan" "vlan_test" {
  provider = ipam.ipam

  vlan_id = 100
  name = "TestVlan"

  site_id = netbox_dcim_site.Site.id
  description = "VLAN created by terraform"
}

#
# Spine Network
#


