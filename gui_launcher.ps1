Add-Type -AssemblyName System.Windows.Forms

$form = New-Object System.Windows.Forms.Form
$form.Text = "Autopilot Setup Helper"
$form.Size = New-Object System.Drawing.Size(400,250)
$form.StartPosition = "CenterScreen"

$runScript = {
    param($scriptName)
    powershell.exe -ExecutionPolicy Bypass -File "$global:usbPath\$scriptName"
}

$buttonNames = @(
    "1-autopilot_script_registration.ps1",
    "2-autopilot_check_device_registration.ps1",
    "3-assign_the_device_to_specific_group.ps1",
    "4-show_groups_of_current_device.ps1",
    "5-check_autopilot_deployment_profile.ps1"
)

$y = 20
foreach ($script in $buttonNames) {
    $btn = New-Object System.Windows.Forms.Button
    $btn.Text = "Run $script"
    $btn.Size = New-Object System.Drawing.Size(360,30)
    $btn.Location = New-Object System.Drawing.Point(10, $y)
    $btn.Add_Click({ $runScript.Invoke($script) })
    $form.Controls.Add($btn)
    $y += 35
}

[void]$form.ShowDialog()
