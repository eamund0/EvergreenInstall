$M365 = Get-EvergreenApp -Name Microsoft365apps  | Where-Object { $_.channel -eq "semiannual"}
$M365Installer = Split-Path -Path $M365.Uri -Leaf
Invoke-WebRequest -Uri $M365.uri -OutFile "c:\apps\$M365Installer" -UseBasicParsing
& ".\$M365Installer" "/download" "c:\apps\v1configuration.xml"
& ".\$M365Installer" "/configure" "c:\apps\v1configuration.xml"