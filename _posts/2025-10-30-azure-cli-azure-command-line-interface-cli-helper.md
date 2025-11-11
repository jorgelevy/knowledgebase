---
title: Azure CLI.- Azure Command-Line Interface (CLI) - Helper
date: 2025-10-30 13:54:00 -700
categories: [AzureCLI]
tags: [azure, azure cli]     # TAG names should always be lowercase
---

# Azure Command-Line Interface (CLI)
<https://learn.microsoft.com/en-us/cli/azure/?view=azure-cli-latest>{:target="_blank"}

## Resources Group
[Resource Manager](https://learn.microsoft.com/en-us/cli/azure/service-page/resource%20manager?view=azure-cli-latest){:target="_blank"}  
<https://learn.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest>{:target="_blank"}

## Storage
<https://learn.microsoft.com/en-us/cli/azure/service-page/storage?view=azure-cli-latest>{:target="_blank"}

## App Services
[App Services](https://learn.microsoft.com/en-us/cli/azure/service-page/app%20services?view=azure-cli-latest){:target="_blank"}  
<https://learn.microsoft.com/en-us/cli/azure/appservice?view=azure-cli-latest>

## Azure Functions
<https://learn.microsoft.com/en-us/cli/azure/service-page/functions?view=azure-cli-latest>{:target="_blank"}

### App Service Plan
```
$resourceName="resourcename"
$resourceGroupName="ResourceGroupName"
$location="westus"

az group create --name $resourceGroupName --location $location

az monitor log-analytics workspace create --name $resourceName --resource-group $resourceGroupName --location $location

$logAnalyticsId="[...]"

az monitor app-insights component create --app $resourceName --resource-group $resourceGroupName --location $location --kind web --workspace $logAnalyticsId

az storage account create --name $resourceName --resource-group $resourceGroupName --location $location --sku Standard_LRS --allow-blob-public-access true --min-tls-version TLS1_2

az storage account blob-service-properties update --account-name $resourceName --resource-group $resourceGroupName --enable-delete-retention true --delete-retention-days 7 --container-retention true --container-days 7

az functionapp plan create --name $resourceName --resource-group $resourceGroupName --location $location --sku P0v3 --is-linux true

az functionapp create --name $resourceName --resource-group $resourceGroupName --plan $resourceName --storage-account $resourceName --os-type Linux --functions-version 4 --runtime dotnet-isolated --runtime-version 9 --app-insights $resourceName

az webapp create --name $resourceName --resource-group $resourceGroupName --plan $resourceName --runtime DOTNETCORE:9.0

az servicebus namespace create --name $resourceName --resource-group $resourceGroupName --location $location --sku Basic

az servicebus queue create --name notifications --resource-group $resourceGroupName --namespace-name $resourceName --max-delivery-count 3 --lock-duration PT30S

az storage container create --name avatars --account-name $resourceName

az storage container create --name predefined-avatars --account-name $resourceName
```
