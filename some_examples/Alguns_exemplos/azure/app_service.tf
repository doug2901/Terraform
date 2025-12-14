resource "azurerm_app_service_plan" "FreePlanWindows" {
  name                = "FreePlanWindows"
  location            = azurerm_resource_group.RG-APP-Services.location
  resource_group_name = azurerm_resource_group.RG-APP-Services.name
  kind                = "app"

  sku {
    tier = "Free" 
    size = "F1"
  }
  tags = {"Study_Project": "APP-Services"}
}

resource "azurerm_app_service" "hml-dougapp" {
name                  = "hml-dougapp"
  location            = azurerm_resource_group.RG-APP-Services.location
  resource_group_name = azurerm_resource_group.RG-APP-Services.name
  app_service_plan_id = azurerm_app_service_plan.FreePlanWindows.id
  client_affinity_enabled = true 
  
  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "VSTSRM"
    use_32_bit_worker_process = true
    default_documents = [
              "Default.htm",
              "Default.html",
              "Default.asp",
              "index.htm",
              "index.html",
              "iisstart.htm",
              "default.aspx",
              "index.php",
              "hostingstart.html"]
  }
  tags = {"Study_Project" = "APP-Services"}
}

resource "azurerm_app_service" "prd-dougapp" {
  name                = "prd-dougapp"
  location            = azurerm_resource_group.RG-APP-Services.location
  resource_group_name = azurerm_resource_group.RG-APP-Services.name
  app_service_plan_id = azurerm_app_service_plan.FreePlanWindows.id
  client_affinity_enabled = true 
  
  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "VSTSRM"
    use_32_bit_worker_process = true
    default_documents = [
              "Default.htm",
              "Default.html",
              "Default.asp",
              "index.htm",
              "index.html",
              "iisstart.htm",
              "default.aspx",
              "index.php",
              "hostingstart.html"]
  }
  tags = {"Study_Project" = "APP-Services"}
}