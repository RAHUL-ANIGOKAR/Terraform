provider "aws" {
  region = "ap-south-1"
}

 provider "azurerm" {
   subscription_id = "azure-subscription-id"
   client_id = "azure-client-id"
   client_secret = "azure-client-secret"
   tenant_id = "azure-tenant-id"
 }