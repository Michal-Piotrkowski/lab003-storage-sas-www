# SAS token dla bezpiecznego dostępu do plików (tylko odczyt)
data "azurerm_storage_account_sas" "files_sas" {
  connection_string = azurerm_storage_account.files.primary_connection_string
  https_only        = true

  start  = timeadd(timestamp(), "-5m")
  expiry = timeadd(timestamp(), "${var.sas_validity_hours}h") # domyślnie 720 h = 30 dni

  resource_types {
    object    = true  # pojedyncze bloby
    container = false # bez operacji na kontenerze (np. listowania)
    service   = false # bez operacji na całej usłudze
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  permissions {
    read    = true # tylko odczyt
    write   = false
    delete  = false
    list    = false
    add     = false
    create  = false
    update  = false
    process = false
    tag     = false
    filter  = false
  }
}