[CmdletBinding()]
Param (
    [Parameter(Mandatory=$true,Position=0)][string]$Identity
)

$office365Credentials= Get-Credential

$office365Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $office365Credentials -Authentication Basic -AllowRedirection
Import-PSSession $office365Session

$unifiedGroupProperties = Get-UnifiedGroup -Identity $Identity | Select-Object HiddenFromExchangeClientsEnabled, HiddenFromAddressListsEnabled

Write-Host "Current $Identity UnifiedGroup Hidden from Exchange Clients enabled: $($unifiedGroupProperties.HiddenFromExchangeClientsEnabled)"
Write-Host "Current $Identity UnifiedGroup Hidden from Address Lists enabled: $($unifiedGroupProperties.HiddenFromAddressListsEnabled)"

Set-UnifiedGroup -Identity $Identity -HiddenFromExchangeClientsEnabled:$false

Write-Host "$Identity UnifiedGroup Hidden from Exchange Clients is now disabled"

Set-UnifiedGroup -Identity $Identity -HiddenFromAddressListsEnabled:$false

Write-Host "Current $Identity UnifiedGroup Hidden from Address Lists is now disabled"

Remove-PSSession $office365Session
