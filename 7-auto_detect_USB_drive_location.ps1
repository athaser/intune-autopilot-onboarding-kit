$usbDrive = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 2 } | Select-Object -First 1 -ExpandProperty DeviceID
if ($usbDrive) {
    Write-Host "USB detected at $usbDrive"
    Set-Location $usbDrive
    $global:usbPath = $usbDrive
} else {
    Write-Warning "No USB drive detected."
}
