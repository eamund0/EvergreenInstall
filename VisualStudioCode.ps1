$VSCode = Get-EvergreenApp -Name MicrosoftVisualStudioCode  | Where-Object { $_.channel -eq "Stable" -and $_.Architecture -eq "x64" -and $_.Platform -eq "win32-x64"}
$VSCInstaller = Split-Path -Path $VSCode.Uri -Leaf
Invoke-WebRequest -Uri $VSCode.Uri -OutFile "c:\buildactions\$VSCInstaller" -UseBasicParsing
& ".\$VSCInstaller" "/verysilent /norestart"