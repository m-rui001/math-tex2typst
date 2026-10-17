[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = 'SilentlyContinue'

function Get-DirSize([string]$path) {
  $sum = 0
  foreach ($f in (Get-ChildItem -LiteralPath $path -Recurse -Force -File)) { $sum += $f.Length }
  return $sum
}

function Show-Children([string]$parent, [int]$top) {
  if (-not (Test-Path -LiteralPath $parent)) { return }
  Write-Output ""
  Write-Output ("=== {0} (children, top {1}) ===" -f $parent, $top)
  Get-ChildItem -LiteralPath $parent -Force | Where-Object { $_.PSIsContainer } | ForEach-Object {
    [pscustomobject]@{ MB = (Get-DirSize $_.FullName)/1MB; Name = $_.Name }
  } | Sort-Object MB -Descending | Select-Object -First $top | ForEach-Object {
    Write-Output ("{0,10:N0} MB  {1}" -f $_.MB, $_.Name)
  }
}

Write-Output "=== SYSTEM INFO ==="
$who = [Security.Principal.WindowsIdentity]::GetCurrent()
$admin = (New-Object Security.Principal.WindowsPrincipal($who)).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
Write-Output ("admin={0}" -f $admin)
Write-Output ("OS: " + (Get-CimInstance Win32_OperatingSystem).Caption + " build " + (Get-CimInstance Win32_OperatingSystem).BuildNumber)

foreach ($t in @('C:\hiberfil.sys','C:\pagefile.sys','C:\swapfile.sys','C:\Windows.old','C:\DumpStack.log.tmp')) {
  if (Test-Path -LiteralPath $t) {
    $i = Get-Item -LiteralPath $t -Force
    Write-Output ("{0,10:N2} GB  {1}" -f ($i.Length/1GB), $t)
  } else { Write-Output ("     n/a  {0}" -f $t) }
}

Write-Output ""
Write-Output "=== WINDOWS CLEANUP-RELEVANT (GB) ==="
foreach ($t in @('C:\Windows\WinSxS','C:\Windows\SoftwareDistribution','C:\Windows\Temp','C:\Windows\Installer','C:\Windows\Logs','C:\ProgramData\Microsoft\Windows Defender','C:\Users\hp\AppData\Local\Microsoft\Windows\INetCache','C:\Users\hp\Downloads','C:\Windows\System32\config\Txv')) {
  if (Test-Path -LiteralPath $t) { Write-Output ("{0,10:N2}  {1}" -f ((Get-DirSize $t)/1GB), $t) }
  else { Write-Output ("     n/a  {0}" -f $t) }
}

Show-Children 'C:\Users\hp\AppData\Local\Temp' 20
Show-Children 'C:\Users\hp\AppData\Local\Programs' 20
Show-Children 'C:\Users\hp\.qoder-cn' 25
Show-Children 'C:\Users\hp\AppData\Roaming\Code' 12
Show-Children 'C:\Users\hp\AppData\Roaming\Tencent' 12
Show-Children 'C:\Users\hp\AppData\Roaming\Trae CN' 12
Show-Children 'C:\Users\hp\AppData\Local\Microsoft' 15
Show-Children 'C:\Users\hp\AppData\Local\Packages' 12
Show-Children 'C:\Users\hp\AppData\Roaming\npm' 8
Show-Children 'C:\Users\hp\.vscode' 8

Write-Output ""
Write-Output "=== FILES > 200 MB under C:\Users\hp (top 40) ==="
Get-ChildItem -LiteralPath 'C:\Users\hp' -Recurse -Force -File | Where-Object { $_.Length -gt 200MB } |
  Sort-Object Length -Descending | Select-Object -First 40 | ForEach-Object {
    Write-Output ("{0,10:N2} GB  {1}" -f ($_.Length/1GB), $_.FullName)
  }

Write-Output ""
Write-Output "=== DONE ==="
