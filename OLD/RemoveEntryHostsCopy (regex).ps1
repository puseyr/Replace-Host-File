Set-ExecutionPolicy Unrestricted 

  $computers = Get-Content "\\nas\Install\Scripts\Powershell\HostsFileUpdate\computerlist.txt"

  $computers | foreach-object ({
  If (Test-Connection $_)
  {
    invoke-command -ComputerName $_ -ScriptBlock {
    (Get-Content "$($env:windir)\system32\Drivers\etc\hosts")  -replace '(0.0.0.0|messenger.yahoo.com|0.0.0.0		messenger.yahoo.com |10.208.1.16 autodiscover.glencore-us.com| 		  |10.208.1.16	autodiscover.glencore-us.com|10.208.1.16	autodiscover.glencore-us.com |10.208.1.16	autodiscover.glencore-us.com 
 )',' ' |
    Out-File "$($env:windir)\system32\Drivers\etc\hosts" -Force
    Write-Host "$($env:computername) Hosts file modified"
  }
  }
  else
  {
    Write-Host "$_ Hosts file modified"
  }
  Out-File "\\usnycsrv2uwfp1\upf\rpusey-sa\WF\RF\Documents\PowerShell building\RemoteEntryHostsCopy"\$computers.txt -Force
}
)