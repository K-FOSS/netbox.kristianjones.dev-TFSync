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
  }
}

module "Vault" {
  source = "./Vault" 
}

provider "netbox" {
  server_url = "http://netbox-http-cont.service.kjdev:8080"
  api_token  = module.Vault.Netbox.Token
}
