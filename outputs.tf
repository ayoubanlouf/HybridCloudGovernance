output "sp_client_id" {
  value = azuread_service_principal.arc_sp.client_id
}

output "sp_client_secret" {
  value = azuread_service_principal_password.arc_sp_pwd.value
  sensitive = true
}

output "tenant_id" {
  value = var.tenant_id
}
