targetScope = 'subscription'

var prefix = 'ancra'
var resourceGroupName = '${prefix}vm'

resource vmresourceGroup  'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: 'JapanEast'
}

module vm 'vm.bicep' = {
  scope: vmresourceGroup
   name:'vm-deploy'
  params:{
    vnetName:'${prefix}subnet'
    publicIPaddressName:'${prefix}publicIP'
    nicName:'${prefix}nic'
  }
  }
}

