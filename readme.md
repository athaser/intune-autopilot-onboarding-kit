# Intune Autopilot Onboarding Kit

This repository provides a set of PowerShell scripts and an optional graphical launcher to streamline the process of onboarding Windows devices into Intune via Windows Autopilot.

It is designed for IT engineers to prepare corporate laptops for new hires, ensuring that each device is registered in Autopilot and ready for automatic configuration on first boot.

---

## 🧭 Use Case

- You’ve received a new Windows device (or reset one).
- Before handing it to the end user, you want to:
  - Register it in Autopilot.
  - Assign it to the correct Azure AD group.
  - Ensure it pulls the correct deployment profile during first setup.

---

## 🖥️ First Boot Steps (Windows Setup)

When a new device is powered on:

1. **Language selection screen appears**.
2. Press **Shift + F10** to open **Command Prompt**.
3. Type `powershell` to switch into PowerShell mode.
4. Navigate to the folder containing these scripts (e.g., USB or Desktop):
   ```powershell
   D:  # Or E: or any other removable drive
   ```

   To see all drives:
   ```powershell
   diskpart
   list volume
   exit
   ```

---

## ▶️ Using the GUI Launcher (Recommended for Non-Engineers)

For ease of use, launch:

```powershell
.\gui_launcher.ps1
```

This provides a **graphical menu** where you can click buttons to run each script. Useful for helpdesk staff or batch registrations.

---

## 🔐 Execution Policy (One-Time Setup)

If script execution is blocked:

### ✅ Recommended (One-Time for Current Session Only):
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
```

This allows script execution **only in the current PowerShell window**.

### ⚠️ Permanent (If Allowed by Your Org):
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

This persists across sessions but may not comply with your organization’s policy.

---

## 📁 Scripts Overview

### `1-autopilot_script_registration.ps1`
Registers the device with Autopilot using hardware hash.

> 🔧 **Make sure you're signed into a tenant with permissions to register devices**.

---

### `2-autopilot_check_device_registration.ps1`
Checks if the device is already registered in Autopilot.

---

### `3-assign_the_device_to_specific_group.ps1`
Assigns the current device to an Azure AD group (used for profile targeting).

> 🛠️ **You must edit this script** to include your **Group Object ID**:
```powershell
$GroupId = "<YOUR_GROUP_OBJECT_ID>"
```

Find this in Azure AD → Groups → Properties → Object ID.

---

### `4-show_groups_of_current_device.ps1`
Displays the Azure AD groups the current device is a member of.

---

### `5-check_autopilot_deployment_profile.ps1`
Confirms if a deployment profile is assigned to this device.

---

### `6-execute_gist.ps1`
Optional script for executing PowerShell content from a GitHub Gist (advanced use).

---

### `7-auto_detect_USB_drive_location.ps1`
Sample utility to identify USB drives automatically (used in older USB-based flows).

---

## 🧪 Testing Locally

You can test all scripts locally on a VM or device before production use. Ensure the device is Azure AD-joined or hybrid-joined for full results.

---

## 👥 Contributions

Feel free to fork and submit improvements:
- Add logging
- Auto-fetch Group Object IDs
- Export results to CSV

---

## 🛡️ Disclaimer

Use these scripts only in authorized environments. Make sure you have the necessary permissions to register devices and assign them to groups in Azure.

---

## 📚 References

- [Add Devices to Windows Autopilot – Microsoft Learn](https://learn.microsoft.com/en-us/autopilot/add-devices)
- [Windows Autopilot Documentation – Microsoft Learn](https://learn.microsoft.com/en-us/mem/autopilot/)
- [Windows Enrollment Methods – Microsoft Intune Docs](https://learn.microsoft.com/en-us/mem/intune/enrollment/windows-enrollment-methods)

