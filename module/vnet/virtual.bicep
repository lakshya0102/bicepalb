
param vnetName string = 'vnet8789'
param location string = resourceGroup().location

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: '10.0.2.0/24'
        }
      }
    ]
  }
}

output vnetid string = vnet.id
output vnetname string = vnetName
output subnetname string = vnet.properties.subnets[0].name
output subnetid string = vnet.properties.subnets[0].id
