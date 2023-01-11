targetScope = 'subscription'

var resourceGroup = 'ancrajp2023-02'
var storageAccountname = 'ancrajp9999'

resource test  'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroup
  location: 'JapanEast'
}

module storage 'storage.bicep' = {
  scope: test
  name: 'storage-deploy'

  params: {
    storageAccountname: storageAccountname
  }
}


