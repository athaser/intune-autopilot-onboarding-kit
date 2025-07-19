Import-Module WindowsAutopilotIntune

$serialNumber = (Get-WmiObject -Class Win32_BIOS).SerialNumber

$device = Get-AutopilotDevice | Where-Object { $_.SerialNumber -eq $serialNumber }

if ($device) {
    Write-Output "Device is registered in Windows Autopilot."
} else {
    Write-Output "Device is NOT registered in Windows Autopilot."
}