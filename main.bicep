targetScope = 'subscription'

resource test 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'testRG'
  location: 'JapanEast'
}