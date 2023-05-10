 terraform {
  required_version = ">= 0.11" 
 backend "azurerm" {
  storage_account_name = "__terraformstorageaccount__"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
	access_key  ="__storagekey__"
	}
	}
  provider "azurerm" {
  features {}
}

#Resource Group
resource "azurerm_resource_group" "example" {
  name     = "PULTerraform"
  location = "West Europe"
}

#App service

resource "azurerm_service_plan" "example" {
  name                = "__appserviceplan__"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type	      = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "example" {
  name                = "__appservicename__"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    application_stack {
      php_version = "8.0"
    }
  }
}

resource "azurerm_app_service_source_control" "example" {
  app_id        = azurerm_linux_web_app.example.id
  use_local_git = true
}

#MySQL Flexible Server

resource "azurerm_mysql_flexible_server" "example" {
  name                   = "mysql-db-lab-5"
  resource_group_name    = azurerm_resource_group.example.name
  location               = azurerm_resource_group.example.location
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  backup_retention_days  = 7
  public_network_access_enabled = true

  sku_name               = "GP_Standard_D2ds_v4"

}
