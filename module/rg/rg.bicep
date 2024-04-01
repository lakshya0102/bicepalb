targetScope = 'subscription'
param location string
param resourceGroupName string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

output resourcegroup object = rg
output resourceGroupId string = rg.id
