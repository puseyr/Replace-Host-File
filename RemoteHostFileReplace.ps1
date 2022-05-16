$computer = Read-Host 'Computer Name?'
Copy-Item -Path "\\nas\install\Scripts\VPNHostsWorkaround\hosts" -Destination "\\$computer\c$\windows\system32\drivers\etc\" -Force