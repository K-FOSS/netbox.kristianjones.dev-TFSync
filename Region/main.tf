terraform {
  required_providers {
    #
    # Netbox Regions
    # 
    # Docs: https://registry.terraform.io/providers/tle06/netbox/latest/docs
    #
    netboxregions = {
      source = "tle06/netbox"
      version = "0.1.0-alpha.7"
    }
  }
}

resource "netboxregions_dcim_region" "Region" {
  name = var.Name

  slug = var.Slug
}