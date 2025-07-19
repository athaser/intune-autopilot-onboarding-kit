$currentSerialNumber = (Get-WmiObject -Class Win32_BIOS).SerialNumber

$profiles = Get-AutoPilotProfile
$profileIds = $profiles | ForEach-Object {
    [PSCustomObject]@{
        displayName = $_.displayName
        id          = $_.id
    }
}

$deviceFound = $false
foreach ($profile in $profileIds) {
    $devices = Get-AutoPilotProfileAssignedDevice -Id $profile.id
    foreach ($device in $devices) {
        if ($device.serialNumber -eq $currentSerialNumber) {
            $deviceFound = $true
            $assignedProfile = $profile
            break
        }
    }
    if ($deviceFound) { break }
}

if ($deviceFound) {
    Write-Output "Device with serial number $currentSerialNumber is assigned to deployment profile: $($assignedProfile.displayName) (ID: $($assignedProfile.id))."
} else {
    Write-Output "Device with serial number $currentSerialNumber is not assigned to any deployment profile."
}
