output "Netbox" {
  value = {
    Token = data.vault_generic_secret.Netbox.data["TOKEN"]
  }
}