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

    #
    # Netbox Orgs and Tenants
    #
    # Docs: https://registry.terraform.io/providers/tpretz/netbox/latest/docs
    #
    netboxorgs = {
      source = "tpretz/netbox"
      version = "2.5.1"
    }

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

module "Vault" {
  source = "./Vault" 
}

provider "netbox" {
  server_url = "http://netbox-http-cont.service.kjdev:8080"
  api_token = module.Vault.Netbox.Token
}

provider "ipam" {
  url = "netbox-http-cont.service.kjdev:8080"
  scheme = "http"

  #
  # Auth
  #
  token = module.Vault.Netbox.Token
}

provider "netboxorgs" {
  server_url = "http://netbox-http-cont.service.kjdev:8080"

  app_id = module.Vault.Netbox.Token
}

provider "netboxregions" {
  host = "http://netbox-http-cont.service.kjdev:8080"
  token = module.Vault.Netbox.Token
}

#
# TODO: Temp Office Sandbox till I move to templates
#

module "Region" {
  source = "./Region"

  Name = "TestRegion"
  Slug = "YWG"
}

module "TMPOffice" {
  source = "./Office"

  Name = "TestHome1"

  Region = module.Region.Region
}