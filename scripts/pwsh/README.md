# Office 365 Powershell Scripts

A collection of Powershell scripts, to simplify Offe 365 management.

All the scripts are tested with both Powershell 5.1 (Povershell.exe - Windows) and Powershell Core 6.1 (pwsh - Windows & MacOS).

When a script is launched, the User is required to enter valid Office 365 Administrator credentials; then a new Office 365 Remote Powershell Session is opened, and closed at the end of the execution.

## Change-UnifiedGroupPrimarySmtpAddress

Changes an Office 365 Group primary SMTP address.

### Parameters

* **Identity**: Mandatory. String. UnifiedGroup Identity to which set a new Primary SMTP Address.
* **PrimarySmtpAddress**: Mandatory. String. Email Address to add and set as Primary SMTP Address for the UnifiedGroup.
* **RemovedOld**: Optional. Switch. If specified the old Primary SMTP Address will be removed from the UnifiedGroup Email Aliases.

### Sample Usage

```
# The current Primary SMTP Address will be  removed from the UnifiedGroup
.\Change-UnifiedGroupPrimarySmtpAddress.ps1 -Identity example -PrimarySmtpAddress example@manageddesigns.it -RemoveOld

# The current Primary SMTP Address will be not removed from the UnifiedGroup
.\Change-UnifiedGroupPrimarySmtpAddress.ps1 -Identity example -PrimarySmtpAddress example@manageddesigns.it
```

## Show-UnifiedGroupInClientsAndLists

Set an Office 365 Group properties to show the Group both on client (eg. Outlook) and in the Company address lists.

### Parameters

* **Identity**: Mandatory. String. UnifiedGroup Identity to which set a new Primary SMTP Address.

### Sample Usage

```
.\Show-UnifiedGroupInClientsAndLists.ps1 -Identity HR
```
