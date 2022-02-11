$M365 = Get-EvergreenApp -Name Microsoft365apps  | Where-Object { $_.channel -eq "semiannual"}
$M365Installer = Split-Path -Path $M365.Uri -Leaf
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/eamund0/EvergreenInstall/main/v1configuration.xml" -OutFile "C:\buildactions\v1configuration.xml"
Invoke-WebRequest -Uri $M365.uri -OutFile "c:\buildactions\$M365Installer" -UseBasicParsing
& ".\$M365Installer" "/download" "c:\buildactions\v1configuration.xml"
& ".\$M365Installer" "/configure" "c:\buildactions\v1configuration.xml"
