
param publicIPaddressName string
param nicName string
param VnetName string

resource publicIP 'Microsoft.Network/publicIPAddresses@2022-07-01' = {
  name: publicIPaddressName
}

resource Vnet 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: VnetName
  location: resourceGroup().location
   properties: {
    addressSpace: {
       addressPrefixes: [
        '10.1.0.0/16'
       ]
    }
    subnets: [
       {
         name:'dafault'
         properties: {
          addressPrefix: '10.1.0.0/24'
         }
       }
    ]
   }
}

resource nic 'Microsoft.Network/networkInterfaces@2022-07-01' = {
  name: nicName
  properties: {
    ipConfigurations: [
       {
         name:'ipconfig1'
         properties: {
          subnet:Vnet.properties.subnets[0]
           publicIPAddress:{
            id:publicIP.id
           }
         }
        }
    ]
  }
}
