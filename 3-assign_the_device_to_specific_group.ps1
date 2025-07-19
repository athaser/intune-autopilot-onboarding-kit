$device = Get-AzureADDevice -SearchString $env:COMPUTERNAME
$deviceId = $device.ObjectId

$groupId = "3a177e18-c8b9-469c-81cd-c2d0c5bddc89"

$group = Get-AzureADGroup -ObjectId $groupId
$groupName = $group.DisplayName

Add-AzureADGroupMember -ObjectId $groupId -RefObjectId $deviceId

Write-Output "Device $env:COMPUTERNAME has been added to the group '$groupName'."
