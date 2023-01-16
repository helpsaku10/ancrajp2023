targetScope = 'subscription'
var prefix = 'ancra'
var resourceGroup = '${prefix}vm'

resource vmresourceGroup  'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroup
  location: 'JapanEast'
}

module vm 'vm.bicep' = {
  scope: vmresourceGroup
   name:'vm-deploy'
  params {
    vnetName:'${prefix}subnet'
    publicIPaddressName:'${prefix}publicIP'
    nicName:'${prefix}nic'
  }
}
