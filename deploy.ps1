### Define the Policy
$definition = New-AzPolicyDefinition `
   -Name "not-allowed-vmextension-windows" `
   -DisplayName "Not allowed VM Extensions" `
   -description "This policy governs which VM extensions that are explicitly denied."   `
   -Policy './rules.json' `
   -Parameter './parameters.json'
### Set the scope for which this policy applies, in our case RG
$scope = "/subscriptions/<<<SubsctiptionId>>>/resourceGroups/<<ResourceGroup>>"

### Assign the policy defined above, and supply the extension names. 
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
