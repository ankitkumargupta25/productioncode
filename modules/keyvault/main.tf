

data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "keyval_prod" {
  name                        = "keyvaultprod-dav-05-21"
  location                    = "Canada Central"
  resource_group_name         = "rg_prod1"
 
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = ["Create","Get", ]
    secret_permissions = ["Set","Get","Delete","Purge","Recover" ]
    

  }
}


resource "azurerm_key_vault_secret" "az_kv_sc" {
  name         = "secret-sauce"
  value        = "szechuan"
  key_vault_id = azurerm_key_vault.keyval_prod.id
}

data "azurerm_key_vault" "kvprod"{
resource_group_name="rg_prod1"
name="keyvaultprod-dav-05-21"
}

data "azurerm_key_vault_secret" "kvs" {
  name         = "secret-sauce"
  key_vault_id = data.azurerm_key_vault.kvprod.id
}

output "secret_value" {
  value     = data.azurerm_key_vault_secret.example.name
  sensitive = true
}





# output "key_uname" {
#   value = data.azurerm_key_vault_secret.linuxvmpwd.name
# }

