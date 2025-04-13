data "azurerm_subscription" "current" {
  subscription_id = var.sub
}


resource "azurerm_policy_definition" "locations" {
  name         = "Allow-Location-Values"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allowed Locations"

  metadata = <<METADATA
    {
    "category": "General"
    }

METADATA


  policy_rule = <<POLICY_RULE
 {
    "if": {
      "not": {
        "field": "location",
        "in": "[parameters('allowedLocations')]"
      }
    },
    "then": {
      "effect": "deny"
    }
  }
POLICY_RULE



  parameters = <<PARAMETERS
 {
    "allowedLocations": {
      "type": "Array",
       "value":  ["${var.only_allowed_locations[0]}", "${var.only_allowed_locations[1]}"],   
      "metadata": {
        "description": "The list of allowed locations for resources.",
        "displayName": "Allowed locations",
        "strongType": "location"
      }
    }
  }
PARAMETERS

}

resource "azurerm_subscription_policy_assignment" "locations-assignment" {
  name                 = "Allow-Locations-Values-assignment"
  policy_definition_id = azurerm_policy_definition.locations.id
  subscription_id      = data.azurerm_subscription.current.id
  parameters           = <<PARAMETERS
 {
    "allowedLocations": {
     
       "value":  ["${var.only_allowed_locations[0]}", "${var.only_allowed_locations[1]}"]
   }
}
PARAMETERS
}

output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}