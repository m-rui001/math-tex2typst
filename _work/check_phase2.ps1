[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = 'SilentlyContinue'

function Get-DirSize([string]$path) {
  $sum = 0
  foreach ($f in (Get-ChildItem -LiteralPath $path -Recurse -Force -File)) { $sum += $f.Length }
  return $sum
}

Write-Output "=== quark.exe version (launcher) ==="
$q = Get-Item 'C:\Users\hp\AppData\Local\Programs\Quark\quark.exe'
Write-Output ("  launcher productversion=" + $q.VersionInfo.ProductVersion + " fileversion=" + $q.VersionInfo.FileVersion)
Write-Output "=== files directly in Programs\Quark ==="
Get-ChildItem 'C:\Users\hp\AppData\Local\Programs\Quark' -Force | ForEach-Object { Write-Output ("  " + $_.Name) }
Write-Output "=== quark.ver / settings markers content (first lines) ==="
foreach ($n in @('quark.ver','settings.json','version','QuarkVersion','setup.exe','debug.log')) {
  $p = 'C:\Users\hp\AppData\Local\Programs\Quark\' + $n
  if (Test-Path -LiteralPath $p) { Write-Output ("  --- " + $n); Get-Content -LiteralPath $p -TotalCount 6 | ForEach-Object { Write-Output ("      " + $_) } }
}
Write-Output "=== unins000.ini / registry DisplayVersion ==="
Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*' | Where-Object { $_.DisplayName -match 'Quark' } | ForEach-Object { Write-Output ("  " + $_.DisplayName + " " + $_.DisplayVersion + "  install=" + $_.InstallLocation) }

Write-Output ""
Write-Output "=== WeMeet\Global children ==="
Get-ChildItem 'C:\Users\hp\AppData\Roaming\Tencent\WeMeet\Global' -Force | ForEach-Object {
  $mb = if ($_.PSIsContainer) { (Get-DirSize $_.FullName)/1MB } else { $_.Length/1MB }
  Write-Output ("  {0,8:N0} MB age={1,6:N1}d  {2}" -f $mb, ((Get-Date) - $_.LastWriteTime).TotalDays, $_.Name)
}

Write-Output ""
Write-Output "=== .bun\install children ==="
Get-ChildItem 'C:\Users\hp\.bun\install' -Force | ForEach-Object {
  $mb = if ($_.PSIsContainer) { (Get-DirSize $_.FullName)/1MB } else { $_.Length/1MB }
  Write-Output ("  {0,8:N0} MB  {1}" -f $mb, $_.Name)
}

Write-Output ""
Write-Output "=== MathWorks\ServiceHost children ==="
Get-ChildItem 'C:\Users\hp\AppData\Local\MathWorks\ServiceHost' -Force | ForEach-Object {
  $mb = if ($_.PSIsContainer) { (Get-DirSize $_.FullName)/1MB } else { $_.Length/1MB }
  Write-Output ("  {0,8:N0} MB age={1,6:N1}d  {2}" -f $mb, ((Get-Date) - $_.LastWriteTime).TotalDays, $_.Name)
}

Write-Output ""
Write-Output "=== installed apps check (are these still installed?) ==="
foreach ($k in @('HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*')) {
  Get-ItemProperty $k | Where-Object { $_.DisplayName -match 'MarsCode|Workbuddy|Trae|ZCode|MATLAB|Genie|Eleckoi|Claude' } | ForEach-Object {
    Write-Output ("  " + $_.DisplayName + "  v" + $_.DisplayVersion)
  }
}

Write-Output ""
Write-Output "=== Trae CN children ==="
Get-ChildItem 'C:\Users\hp\AppData\Roaming\Trae CN' -Force | ForEach-Object {
  $mb = if ($_.PSIsContainer) { (Get-DirSize $_.FullName)/1MB } else { $_.Length/1MB }
  Write-Output ("  {0,8:N0} MB age={1,6:N1}d  {2}" -f $mb, ((Get-Date) - $_.LastWriteTime).TotalDays, $_.Name)
}

Write-Output ""
Write-Output "=== C: free ==="
Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' } | ForEach-Object { Write-Output ("  free={0:N2} GB" -f ($_.FreeSpace/1GB)) }
