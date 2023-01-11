param storageAccountname string

resource strage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountname
  location:'japaneast'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
