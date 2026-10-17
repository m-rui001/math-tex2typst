[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$log = 'E:\math\_work\system_phase.log'
Set-Content -LiteralPath $log -Value ("elevated start " + (Get-Date).ToString('s') + "  admin=" + ((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)))

function Say([string]$s) { Write-Output $s; Add-Content -LiteralPath $log -Value $s }

Say "=== before ==="
Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DeviceID -in @('C:','D:') } | ForEach-Object { Say ("  {0} free={1:N2} GB" -f $_.DeviceID, ($_.FreeSpace/1GB)) }

Say ""
Say "=== [1] hibernation off ==="
Say (powercfg /h off | Out-String)
Say ("  hiberfil exists now: " + (Test-Path -LiteralPath 'C:\hiberfil.sys'))

Say ""
Say "=== [2] pagefile reconfigure ==="
$cs = Get-CimInstance Win32_ComputerSystem
Say ("  AutomaticManagedPagefile was: " + $cs.AutomaticManagedPagefile)
if ($cs.AutomaticManagedPagefile) {
  Set-CimInstance -InputObject $cs -Property @{ AutomaticManagedPagefile = $false }
  Start-Sleep -Seconds 2
  $cs2 = Get-CimInstance Win32_ComputerSystem
  Say ("  AutomaticManagedPagefile now: " + $cs2.AutomaticManagedPagefile)
}
Say "  existing Win32_PageFileSetting entries:"
foreach ($p in (Get-CimInstance Win32_PageFileSetting)) {
  Say ("    " + $p.Name + "  initial=" + $p.InitialSize + "MB max=" + $p.MaximumSize + "MB")
}
$cset = Get-CimInstance Win32_PageFileSetting -Filter "Name='C:\\pagefile.sys'"
if ($cset) {
  Set-CimInstance -InputObject $cset -Property @{ InitialSize = 4096; MaximumSize = 8192 }
  Say "  C: pagefile set to initial=4096MB max=8192MB"
} else {
  $d = ([WMIClass] 'Win32_PageFileSetting')
  $o = $d.CreateInstance()
  $o.Name = 'C:\pagefile.sys'
  $o.InitialSize = 4096
  $o.MaximumSize = 8192
  $o.Put() | Out-Null
  Say "  C: pagefile created at initial=4096MB max=8192MB"
}
$dset = Get-CimInstance Win32_PageFileSetting -Filter "Name='D:\\pagefile.sys'"
if (-not $dset) {
  $d2 = ([WMIClass] 'Win32_PageFileSetting')
  $o2 = $d2.CreateInstance()
  $o2.Name = 'D:\pagefile.sys'
  $o2.InitialSize = 0
  $o2.MaximumSize = 0
  $o2.Put() | Out-Null
  Say "  D: pagefile created as system-managed"
} else { Say "  D: pagefile already present" }
Say "  re-read:"
foreach ($p in (Get-CimInstance Win32_PageFileSetting)) {
  Say ("    " + $p.Name + "  initial=" + $p.InitialSize + "MB max=" + $p.MaximumSize + "MB")
}
Say "  NOTE: current C:\pagefile.sys stays 32GB until next reboot."

Say ""
Say "=== [3] shadow copy storage (READ ONLY) ==="
Say (vssadmin list shadowstorage 2>&1 | Out-String)
Say "  volume info:"
Say (Get-CimInstance Win32_SystemRestore | Select-Object -First 1 | Out-String)

Say ""
Say "=== after ==="
Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DeviceID -in @('C:','D:') } | ForEach-Object { Say ("  {0} free={1:N2} GB" -f $_.DeviceID, ($_.FreeSpace/1GB)) }
Say "=== SYSTEM PHASE DONE ==="
