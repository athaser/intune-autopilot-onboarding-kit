Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Get the folder where this script is located
$scriptFolder = Split-Path -Parent $MyInvocation.MyCommand.Definition

function Run-Script {
    param ([string]$scriptName)
    $scriptPath = Join-Path $scriptFolder $scriptName

    if (Test-Path $scriptPath) {
        Start-Process powershell.exe `
            -ArgumentList "-NoExit", "-ExecutionPolicy", "Bypass", "-File", "`"$scriptPath`"" `
            -WorkingDirectory $scriptFolder
    } else {
        [System.Windows.Forms.MessageBox]::Show("Script not found:`n$scriptPath")
    }
}

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Autopilot Setup Helper"
$form.Size = New-Object System.Drawing.Size(420, 360)
$form.StartPosition = "CenterScreen"

# List of scripts
$scriptList = @(
    "1-autopilot_script_registration.ps1",
    "2-autopilot_check_device_registration.ps1",
    "3-assign_the_device_to_specific_group.ps1",
    "4-show_groups_of_current_device.ps1",
    "5-check_autopilot_deployment_profile.ps1",
    "6-execute_gist.ps1",
    "7-auto_detect_USB_drive_location.ps1"
)

# Add buttons with unique click handlers
$y = 20
foreach ($scriptName in $scriptList) {
    $btn = New-Object System.Windows.Forms.Button
    $btn.Text = "Run $scriptName"
    $btn.Size = New-Object System.Drawing.Size(380, 30)
    $btn.Location = New-Object System.Drawing.Point(10, $y)

    # Create a new script block with the specific script hardcoded in it
    $btn.Add_Click([scriptblock]::Create("Run-Script '$scriptName'"))

    $form.Controls.Add($btn)
    $y += 35
}

# Show the form
[void]$form.ShowDialog()
