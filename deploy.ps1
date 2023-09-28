$definition = New-AzPolicyDefinition `
   -Name "not-allowed-vmextension-windows" `
   -DisplayName "Not allowed VM Extensions" `
   -description "This policy governs which VM extensions that are explicitly denied."   `
   -Policy './rules.json' `
   -Parameter './parameters.json'

$scope = "/subscriptions/f3482bdc-db98-4c56-b961-f7fb0e8eef3f/resourceGroups/myResourceGroup"
$assignment = New-AzPolicyAssignment `
   -Name "not-allowed-vmextension-windows" `
   -Scope $scope `
   -PolicyDefinition $definition `
   -PolicyParameter '{
    "notAllowedExtensions": {
        "value": ["MDC.Windows","MDE.Windows"]
    }
}'
$assignment
