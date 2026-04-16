resource "azurerm_policy_definition" "arc_linux_ama" {
  name         = "ArcLinuxAMA"
  policy_type  = "Custom"       # BuiltIn policies cannot be recreated; use Custom here
  mode         = "Indexed"
  display_name = "Linux Arc-enabled machines should have Azure Monitor Agent installed"

  policy_rule = <<POLICY_RULE
{
  "if": {
    "allOf": [
      {
        "equals": "Microsoft.HybridCompute/machines",
        "field": "type"
      },
      {
        "equals": "linux",
        "field": "Microsoft.HybridCompute/machines/osName"
      }
    ]
  },
  "then": {
    "effect": "AuditIfNotExists",
    "details": {
      "type": "Microsoft.HybridCompute/machines/extensions",
      "existenceCondition": {
        "allOf": [
          {
            "equals": "AzureMonitorLinuxAgent",
            "field": "Microsoft.HybridCompute/machines/extensions/type"
          },
          {
            "equals": "Microsoft.Azure.Monitor",
            "field": "Microsoft.HybridCompute/machines/extensions/publisher"
          },
          {
            "equals": "Succeeded",
            "field": "Microsoft.HybridCompute/machines/extensions/provisioningState"
          }
        ]
      }
    }
  }
}
POLICY_RULE

}

resource "azurerm_resource_group_policy_assignment" "arc_linux_ama_assignment" {
  name                 = "ArcLinuxAMA"
  resource_group_id    = azurerm_resource_group.rg.id
  policy_definition_id = azurerm_policy_definition.arc_linux_ama.id
}
