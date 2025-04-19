resource "azurerm_monitor_action_group" "ActionGroup" {
  name                = "ActionGroup"
  resource_group_name = azurerm_resource_group.RG.name
  short_name          = "TestAlert"


  email_receiver {
    name          = "EmailReceiver"
    email_address = var.email_address
  }
}

resource "azurerm_monitor_metric_alert" "alert" {
  name                = "CPU-Metric-Alert"
  resource_group_name = azurerm_resource_group.RG.name
  scopes              = [azurerm_linux_virtual_machine_scale_set.vmss.id]
  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 50
  }
  action {
    action_group_id = azurerm_monitor_action_group.ActionGroup.id
  }

}

resource "azurerm_monitor_autoscale_setting" "alert2" {
  name                = "Autoscale-Setting"
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.vmss.id

  profile {
    name = "defaultProfile"

    capacity {
      default = 1
      minimum = 1
      maximum = 10
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 50
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }


}
