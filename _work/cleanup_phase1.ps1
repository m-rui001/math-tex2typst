[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = 'SilentlyContinue'

$HOME_DIR = 'C:\Users\hp'
$log = 'E:\math\_work\cleanup_phase1.log'
Set-Content -LiteralPath $log -Value ("phase1 start " + (Get-Date).ToString('s'))

function Get-DirBytes([string]$path) {
  $sum = 0
  foreach ($f in (Get-ChildItem -LiteralPath $path -Recurse -Force -File)) { $sum += $f.Length }
  return $sum
}

function Purge-Contents([string]$path, [string]$why) {
  if (-not $path.StartsWith($HOME_DIR + '\')) { Write-Output ("SKIP(outside home) " + $path); return }
  if (-not (Test-Path -LiteralPath $path)) { Write-Output ("ABSENT " + $path); return }
  $before = Get-DirBytes $path
  Get-ChildItem -LiteralPath $path -Force | ForEach-Object {
    Remove-Item -LiteralPath $_.FullName -Recurse -Force
  }
  $after = Get-DirBytes $path
  $freed = ($before - $after) / 1GB
  $line = ("{0,7:N2} GB freed  [{1}]  {2}" -f $freed, $why, $path)
  Write-Output $line
  Add-Content -LiteralPath $log -Value ($line + "  (before={0:N0} after={1:N0} bytes)" -f $before, $after)
}

Write-Output "=== package / build caches ==="
Purge-Contents 'C:\Users\hp\AppData\Local\npm-cache' 'npm cache'
Purge-Contents 'C:\Users\hp\AppData\Local\pip\Cache' 'pip cache'
Purge-Contents 'C:\Users\hp\.cache\codex-runtimes' 'codex runtime downloads'
Purge-Contents 'C:\Users\hp\AppData\Local\Microsoft\vscode-cpptools' 'cpptools browse DB'

Write-Output ""
Write-Output "=== VS Code caches (not settings) ==="
Purge-Contents 'C:\Users\hp\AppData\Roaming\Code\CachedExtensionVSIXs' 'vsix installers'
Purge-Contents 'C:\Users\hp\AppData\Roaming\Code\Cache' 'code cache'
Purge-Contents 'C:\Users\hp\AppData\Roaming\Code\GPUCache' 'gpu cache'
Purge-Contents 'C:\Users\hp\AppData\Roaming\Code\CachedData' 'cached data'
Purge-Contents 'C:\Users\hp\AppData\Roaming\Code\Crashpad' 'crash dumps'
Purge-Contents 'C:\Users\hp\AppData\Roaming\Code\User\globalStorage\saoudrizwan.claude-dev\puppeteer' 'puppeteer chromium snapshot'

Write-Output ""
Write-Output "=== updater payloads ==="
Purge-Contents 'C:\Users\hp\AppData\Local\@genieworkbuddy-desktop-updater' 'genieworkbuddy installer'
Purge-Contents 'C:\Users\hp\AppData\Local\@zcodedesktop-updater' 'zcode installer'
Purge-Contents 'C:\Users\hp\AppData\Local\qoder-updater' 'qoder installer'
Purge-Contents 'C:\Users\hp\AppData\Local\qoder-cn-updater' 'qoder-cn installer'
Purge-Contents 'C:\Users\hp\AppData\Local\eleckoi-desktop-updater' 'eleckoi installer'
Purge-Contents 'C:\Users\hp\AppData\Local\Quark\User Data\updates' 'quark update pkg'
Purge-Contents 'C:\Users\hp\AppData\Roaming\Tencent\WeMeet\Global\UpdatePackages' 'wemeet update pkg'
Purge-Contents 'C:\Users\hp\AppData\Local\Temp\vscode-stable-user-x64' 'vscode setup exe'

Write-Output ""
Write-Output "=== misc regenerable caches ==="
Purge-Contents 'C:\Users\hp\AppData\Local\NRC\Saved\ProgramBinaryCache' 'shader precache'
Purge-Contents 'C:\Users\hp\AppData\Local\javasharedresources' 'java shared class cache'

Write-Output ""
Write-Output "=== Qoder agent residue (older than today) ==="
foreach ($sub in @('runs','sessions')) {
  $r = 'C:\Users\hp\.qoder-cn\logs\' + $sub
  if (-not (Test-Path -LiteralPath $r)) { continue }
  $today = (Get-Date).Date
  $cut = 0
  foreach ($i in (Get-ChildItem -LiteralPath $r -Force | Where-Object { $_.LastWriteTime -lt $today })) {
    $cut += Get-DirBytes $i.FullName
    Remove-Item -LiteralPath $i.FullName -Recurse -Force
  }
  $line = ("{0,7:N2} GB freed  [old {1} logs]  {2}" -f ($cut/1GB), $sub, $r)
  Write-Output $line
  Add-Content -LiteralPath $log -Value $line
}
Purge-Contents 'C:\Users\hp\.qoder-cn\file-history' 'file-history'

Write-Output ""
Write-Output "=== Xftp transfer leftovers (approved) ==="
$xd = 'C:\Users\hp\Documents\NetSarang Computer\8\Xftp\Temporary'
if (Test-Path -LiteralPath $xd) {
  $b = Get-DirBytes $xd
  Get-ChildItem -LiteralPath $xd -Force | ForEach-Object { Remove-Item -LiteralPath $_.FullName -Recurse -Force }
  $a = Get-DirBytes $xd
  $line = ("{0,7:N2} GB freed  [xftp temporary]  {1}" -f (($b-$a)/1GB), $xd)
  Write-Output $line
  Add-Content -LiteralPath $log -Value $line
}

Write-Output ""
Write-Output "=== C: free now ==="
Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' } | ForEach-Object {
  Write-Output ("C: free={0:N2} GB" -f ($_.FreeSpace/1GB))
  Add-Content -LiteralPath $log -Value ("free={0:N2} GB" -f ($_.FreeSpace/1GB))
}
Write-Output "=== PHASE1 DONE ==="
