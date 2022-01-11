$7zip = Get-EvergreenApp -Name 7Zip  | Where-Object { $_.Architecture -eq "x64" -and $_.Type -eq "msi" }
$Installer = Split-Path -Path $7zip.Uri -Leaf
Invoke-WebRequest -Uri $7zip.uri -OutFile "c:\apps\$Installer" -UseBasicParsing
& "$env:SystemRoot\System32\msiexec.exe" "/package" c:\apps\$Installer "/quiet"