$ADuser = Read-Host "Enter Username"
$NewProxyAddress = Read-Host "Enter new Email Address e.g. john@stripeolt.com"

Get-AdUser -Identity $ADuser -Properties SamAccountName, ProxyAddresses
Set-AdUser -Identity $ADuser -Add@{Proxyaddresses="SMTP:"+$NewProxyAddress}
