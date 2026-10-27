# Nazwa Storage Account (wymagane przez zadanie)
output "storage_account_name" {
  description = "Nazwa utworzonego Storage Account"
  value       = azurerm_storage_account.files.name
}

# URL-e plików z SAS tokenami
output "file_urls_with_sas" {
  description = "URL-e plików z SAS tokenami"
  value = {
    for filename, blob in azurerm_storage_blob.shared_files :
    filename => "${blob.url}?${trimprefix(data.azurerm_storage_account_sas.files_sas.sas, "?")}"
  }
  sensitive = true
}

# Sam token SAS (np. do doklejenia do innych URL-i)
output "sas_token" {
  description = "Token SAS do plików (wrażliwy)"
  value       = data.azurerm_storage_account_sas.files_sas.sas
  sensitive   = true
}