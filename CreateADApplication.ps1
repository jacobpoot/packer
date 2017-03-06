param (

[string]$azurelocation = 'West Europe',
[string]$app_password = 'P@ssw0rd',
[string]$subscription_ID

)

Add-AzureRmAccount
$azuresub = Get-AzureRmSubscription -SubscriptionId $subscription_ID

New-AzureRmResourceGroup -Name packer-images -Location $azurelocation -Tag @{Name='packer-images'} -Verbose

$azurestorage = New-AzureRmStorageAccount -ResourceGroupName packer-images -Name packerimagesjacobstore$(Get-Random) -SkuName Standard_GRS -Location $azurelocation -Tags @{Name='packer-images'} -Verbose

New-AzureRmADApplication -DisplayName packer-images -HomePage http://azuregek.nl/packer-images -IdentifierUris http://azuregek.nl/packer-images -Password $app_password -Verbose

$app = Get-AzureRmADApplication -IdentifierUri http://azuregek.nl/packer-images -Verbose

New-AzureRmADServicePrincipal -ApplicationId $app.ApplicationId -Verbose
Start-Sleep -Seconds 10
$roleassignment = New-AzureRmRoleAssignment -ServicePrincipalName http://azuregek.nl/packer-images -RoleDefinitionName Owner -Scope /subscriptions/8c6f9e0e-915e-4898-b190-8494072467b2 -Verbose

$result = @{SubscriptionID="$($azuresub.SubscriptionId)"; TenantID = "$($azuresub.TenantId)"; ClientID = "$($app.ApplicationId)"; client_secret = $app_password; resource_group_name = 'packer-images'; storage_account = "$($azurestorage.StorageAccountName)"; object_id = "$($roleassignment.ObjectId)"}
$result