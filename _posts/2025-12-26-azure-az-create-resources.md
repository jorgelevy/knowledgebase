---
title: Azure AZ.- Create Resources
date: 2025-12-26 00:00:00 -700
categories: [Azure AZ]
tags: [azure, azure az, azure web app, azure functions]     # TAG names should always be lowercase
---

# App Service Plan

```
$resourceName="myquiniela"
$resourceGroupName="MyQuiniela"
$location="mexicocentral"
$logAnalyticsId="..."

az group create --name $resourceGroupName --location $location

az monitor log-analytics workspace create --name $resourceName --resource-group $resourceGroupName --location $location

az monitor app-insights component create --app $resourceName --resource-group $resourceGroupName --location $location --kind web --workspace $logAnalyticsId

az storage account create --name $resourceName --resource-group $resourceGroupName --location $location --sku Standard_LRS --allow-blob-public-access true --min-tls-version TLS1_2

az storage account blob-service-properties update --account-name $resourceName --resource-group $resourceGroupName --enable-delete-retention true --delete-retention-days 7 --container-retention true --container-days 7

az functionapp plan create --name $resourceName --resource-group $resourceGroupName --location $location --sku P0v3 --is-linux true

az functionapp create --name $resourceName-gamessync --resource-group $resourceGroupName --plan $resourceName --storage-account $resourceName --os-type Linux --functions-version 4 --runtime dotnet-isolated --runtime-version 10 --app-insights $resourceName

az functionapp create --name $resourceName-messaging --resource-group $resourceGroupName --plan $resourceName --storage-account $resourceName --os-type Linux --functions-version 4 --runtime dotnet-isolated --runtime-version 10 --app-insights $resourceName

az functionapp create --name $resourceName-messagingsender --resource-group $resourceGroupName --plan $resourceName --storage-account $resourceName --os-type Linux --functions-version 4 --runtime dotnet-isolated --runtime-version 10 --app-insights $resourceName

az webapp create --name $resourceName-api --resource-group $resourceGroupName --plan $resourceName --runtime DOTNETCORE:10.0

az webapp create --name $resourceName-web --resource-group $resourceGroupName --plan $resourceName --runtime DOTNETCORE:10.0

az servicebus namespace create --name $resourceName --resource-group $resourceGroupName --location $location --sku Basic

az servicebus queue create --name notifications --resource-group $resourceGroupName --namespace-name $resourceName --max-delivery-count 3 --lock-duration PT30S

az storage container create --name avatars --account-name $resourceName

az storage container create --name predefined-avatars --account-name $resourceName
```
