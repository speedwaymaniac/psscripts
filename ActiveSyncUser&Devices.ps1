$csvRows=@()
“==============================================================”
“Start Mailbox Retrieve”
“==============================================================”
$mbx = get-casmailbox -ResultSize unlimited | where {$_.hasactivesyncdevicepartnership -eq $true -and $_.identity -notlike “*CAS_{*”} ;
“==============================================================”
“End Mailbox Retrieve”
“==============================================================”
$mbx | foreach {
“Processing: “+$_.name
$name = $_.name;
$device = get-activesyncdevicestatistics -mailbox $_.identity;
if($device){
foreach($dev in $device){
” Device: “+$dev.DeviceType
$csvRows += $dev
}
}
}
“==============================================================”
“Start CSV Write”
“==============================================================”
$csvRows | Export-Csv “c:\Audit\phonelist.csv” -NoType
“==============================================================”
“End CSV Write”
“==============================================================”