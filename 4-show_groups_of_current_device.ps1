# Get the current device's object ID
$device = Get-AzureADDevice -SearchString $env:COMPUTERNAME
$deviceId = $device.ObjectId

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "Device.Read.All", "Group.Read.All"

# Get the groups assigned to the current device
$groups = Invoke-MgGraphRequest -Method GET -Uri "https://graph.microsoft.com/v1.0/devices/$deviceId/memberOf"

# Display the groups
$groups.value | ForEach-Object {
    Write-Output "Group: $($_.displayName)"
}
