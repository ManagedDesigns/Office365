[CmdletBinding()]
Param (
    [Parameter(Mandatory=$true,Position=0)][string]$Identity,
    [Parameter(Mandatory=$true,Position=1)][string]$PrimarySmtpAddress,
    [Parameter(Mandatory=$false)][switch]$RemoveOld
)

$office365Credentials = Get-Credential

$office365Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $office365Credentials -Authentication Basic -AllowRedirection
Import-PSSession $office365Session

$unifiedGroupProperties = Get-UnifiedGroup -Identity $Identity | Select-Object PrimarySMTPAddress

Write-Host "Current $Identity UnifiedGroup Primary SMTP Address: $($unifiedGroupProperties.PrimarySmtpAddress)"

Set-UnifiedGroup -Identity $Identity -EmailAddresses @{ Add="smtp:$PrimarySmtpAddress" }

Write-Host "Added $PrimarySmtpAddress Email Address to $Identity UnifiedGroup"

Set-UnifiedGroup -Identity $Identity -PrimarySmtpAddress $PrimarySmtpAddress

Write-Host "Changed $Identity UnifiedGroup Primary SMTP Address to: $PrimarySmtpAddress"

if ($RemoveOld) {
    Set-UnifiedGroup -Identity $Identity -EmailAddresses @{ Remove="smtp:$($unifiedGroupProperties.PrimarySmtpAddress)" }

    Write-Host "Removed $($unifiedGroupProperties.PrimarySmtpAddress) from $Identity UnifiedGroup"
}

Remove-PSSession $office365Session
