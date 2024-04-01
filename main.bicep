// targetScope = 'subscription'
param vmName string ='myvm8975'
param vnetName string = 'vnet8789'
param location string = 'East US'
param adminUsername string = 'hellouser'
param resourceGroupName string = 'lakshya09'





//  resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
//   name: resourceGroupName
//    location: location
//  }


module vnetModule './module/vnet/virtual.bicep' = {

  name: 'networkModule'
  params: {
    vnetName: vnetName
    location: location
  }
}

module vmModule './module/virtualmachine/vm.bicep' = {

  name: 'vmModule'
  scope: resourceGroup(resourceGroupName)
  params: {
    vmName: vmName
    vnetId: vnetModule.outputs.vnetid
    location: location
    adminUsername:adminUsername
   
  }
  

}

module internalLB './module/loadbalancer/lb.bicep' = {
  scope: resourceGroup(resourceGroupName)
  name: 'internalLB'
  params: {
    location: location
    vnetName: vnetModule.outputs.vnetname
    subnetid: vnetModule.outputs.subnetid
}
}

output vmId string = vmModule.outputs.vmId



