# Grupa zasobów utworzona w lab 2 (rg-labs-basic-26)
data "azurerm_resource_group" "basic" {
  name = local.rg.basic
}

# Tożsamość zalogowana w az login (object_id dla przypisań RBAC)
data "azurerm_client_config" "current" {}
