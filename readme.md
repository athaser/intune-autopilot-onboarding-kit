# Intune Autopilot Onboarding Kit

This repository demonstrates how to register and onboard Windows devices into Microsoft Intune using Windows Autopilot. It is tailored for IT engineers responsible for preparing laptops for new hires, so that each user receives a device that is fully configured, enrolled in Intune, and ready to use.

## 🧭 Purpose

This guide and set of scripts assist with:
- Verifying Autopilot registration status
- Registering a device via PowerShell
- Assigning the device to proper Azure AD groups
- Ensuring smooth Autopilot experience

## 🖥️ First-Time Setup Instructions

When a new Windows device boots up for the first time, the following steps are recommended:

### 1. Initial Windows Setup Screen

The **first screen** is typically the **language selection screen**.

### 2. Launch PowerShell

- Press **Shift + F10** to open the Command Prompt.
- Type `powershell` to enter PowerShell mode.

### 3. Navigate to USB with Scripts

Assuming the scripts are stored on a USB:

- Type `diskpart`, then `list volume` to see all available drives.
- Find your USB drive (commonly `D:` or `E:`).
- Exit diskpart: `exit`
- Switch to the USB drive by typing:
  ```powershell
  D:


🛡️ Disclaimer
Use these scripts only in test or authorized environments. Ensure device identifiers are valid before submission.

