[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = 'SilentlyContinue'

$HOME_DIR = 'C:\Users\hp'
$log = 'E:\math\_work\cleanup_phase2.log'
Set-Content -LiteralPath $log -Value ("phase2 start " + (Get-Date).ToString('s'))

function Get-DirBytes([string]$path) {
  $sum = 0
  foreach ($f in (Get-ChildItem -LiteralPath $path -Recurse -Force -File)) { $sum += $f.Length }
  return $sum
}

function Report([string]$what, [double]$bytes) {
  $line = ("{0,7:N2} GB  {1}" -f ($bytes/1GB), $what)
  Write-Output $line
  Add-Content -LiteralPath $log -Value $line
}

function Purge-Dir([string]$path, [string]$why) {
  if (-not $path.StartsWith($HOME_DIR)) { Write-Output ("SKIP(outside home) " + $path); return }
  if (-not (Test-Path -LiteralPath $path)) { Write-Output ("ABSENT " + $path); return }
  $before = Get-DirBytes $path
  Remove-Item -LiteralPath $path -Recurse -Force
  $after = 0
  if (Test-Path -LiteralPath $path) { $after = Get-DirBytes $path }
  Report ("[del] " + $why) ($before - $after)
  if ($after -gt 0) { Write-Output ("        remaining " + $after + " bytes at " + $path) }
}

function Purge-Contents([string]$path, [string]$why) {
  if (-not $path.StartsWith($HOME_DIR)) { Write-Output ("SKIP(outside home) " + $path); return }
  if (-not (Test-Path -LiteralPath $path)) { Write-Output ("ABSENT " + $path); return }
  $before = Get-DirBytes $path
  Get-ChildItem -LiteralPath $path -Force | ForEach-Object { Remove-Item -LiteralPath $_.FullName -Recurse -Force }
  Report ("[purge] " + $why) ($before - (Get-DirBytes $path))
}

Write-Output "=== stale app leftovers (verified uninstalled / superseded) ==="
Purge-Dir 'C:\Users\hp\AppData\Roaming\Trae CN' 'Trae CN (no uninstall entry, stale 158d+)'
Purge-Dir 'C:\Users\hp\AppData\Roaming\Tencent\WeChat' 'legacy WeChat 3.x tree (stale 769d; current app uses xwechat)'
Purge-Dir 'C:\Users\hp\.marscode' 'MarsCode extension data (stale 388d)'
Purge-Dir 'C:\Users\hp\AppData\Local\Programs\Quark\7.0.7.940' 'Quark superseded build (launcher is 7.3.5.1009)'
Purge-Contents 'C:\Users\hp\AppData\Local\Programs\Quark\Temp' 'Quark temp'

Write-Output ""
Write-Output "=== logs / caches inside still-installed apps ==="
Purge-Dir 'C:\Users\hp\.workbuddy\logs' 'workbuddy logs'
Purge-Dir 'C:\Users\hp\AppData\Local\MathWorks\ServiceHost\logs' 'MATLAB ServiceHost logs'
Purge-Dir 'C:\Users\hp\AppData\Local\MathWorks\ServiceHost\crash_reports' 'MATLAB ServiceHost crash reports'
Purge-Dir 'C:\Users\hp\AppData\Roaming\Tencent\xwechat\log' 'WeChat logs'
Purge-Contents 'C:\Users\hp\AppData\Roaming\Tencent\WeMeet\Global\Logs' 'WeMeet logs'
Purge-Dir 'C:\Users\hp\.codex\sessions' 'codex sessions (stale 17d)'
Purge-Dir 'C:\Users\hp\.codex\cache' 'codex cache'
Purge-Dir 'C:\Users\hp\.codex\.tmp' 'codex tmp'
Purge-Contents 'C:\Users\hp\.bun\install\cache' 'bun install cache'
Purge-Contents 'C:\Users\hp\.zcode\tmp' 'zcode tmp'
Purge-Dir 'C:\Users\hp\AppData\Roaming\Code\Backups' 'vscode editor backups'

Write-Output ""
Write-Output "=== Temp items older than 3 days (current session dir excluded) ==="
$cut = 0
Get-ChildItem -LiteralPath 'C:\Users\hp\AppData\Local\Temp' -Force | ForEach-Object {
  $age = ((Get-Date) - $_.LastWriteTime).TotalDays
  if ($age -gt 3 -and $_.Name -ne 'qoder-cli-cn') {
    $sz = if ($_.PSIsContainer) { Get-DirBytes $_.FullName } else { $_.Length }
    Remove-Item -LiteralPath $_.FullName -Recurse -Force
    $cut += $sz
  }
}
Report "[purge] Temp items age>3d" $cut

Write-Output ""
Write-Output "=== pip broken-install leftovers (~dir) and __pycache__ ==="
$sp = 'C:\Users\hp\AppData\Local\Programs\Python\Python313\Lib\site-packages'
if (Test-Path -LiteralPath $sp) {
  $cut2 = 0
  Get-ChildItem -LiteralPath $sp -Force -Directory | Where-Object { $_.Name -like '~*' } | ForEach-Object {
    $sz = Get-DirBytes $_.FullName
    Remove-Item -LiteralPath $_.FullName -Recurse -Force
    $cut2 += $sz
    Write-Output ("        removed " + $_.Name)
  }
  Report "[purge] pip '~' partial dirs" $cut2
}
$cut3 = 0
foreach ($d in (Get-ChildItem -LiteralPath 'C:\Users\hp\AppData\Local\Programs\Python' -Recurse -Force -Directory -Filter '__pycache__')) {
  $cut3 += Get-DirBytes $d.FullName
  Remove-Item -LiteralPath $d.FullName -Recurse -Force
}
Report "[purge] Python __pycache__" $cut3

Write-Output ""
Write-Output "=== C: free now ==="
Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' } | ForEach-Object {
  Write-Output ("C: free={0:N2} GB" -f ($_.FreeSpace/1GB))
  Add-Content -LiteralPath $log -Value ("free={0:N2} GB" -f ($_.FreeSpace/1GB))
}
Write-Output "=== PHASE2 DONE ==="
