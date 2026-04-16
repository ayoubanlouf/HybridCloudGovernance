resource "azurerm_resource_group" "rg" {
  name     = "ArcProjectRG"
  location = "westeurope"
}

resource "azuread_application" "arc_app" {
  display_name = "ArcProjectApp"
}

resource "azuread_service_principal" "arc_sp" {
  client_id = azuread_application.arc_app.client_id
}

resource "azuread_service_principal_password" "arc_sp_pwd" {
  service_principal_id = azuread_service_principal.arc_sp.id
  end_date             = timeadd(timestamp(), "8760h")
}

resource "azurerm_role_assignment" "arc_role" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Azure Connected Machine Onboarding"
  principal_id         = azuread_service_principal.arc_sp.object_id
}
