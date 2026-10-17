[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = 'SilentlyContinue'

$HOME_DIR = 'C:\Users\hp'
$log = 'E:\math\_work\cleanup_phase3.log'
Set-Content -LiteralPath $log -Value ("phase3 start " + (Get-Date).ToString('s'))

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
  if ($after -gt 0) { Write-Output ("        locked/remaining: " + [math]::Round($after/1MB) + " MB at " + $path) }
}

Write-Output "=== the runaway traceback file (verify static, then delete) ==="
$big = 'C:\Users\hp\AppData\Local\Temp\qoder-cli-cn\E--math\cd5786df-ab20-47eb-8821-405d0c904858\tasks\b3j93hpcc.output'
if (Test-Path -LiteralPath $big) {
  $i1 = Get-Item -LiteralPath $big -Force
  Start-Sleep -Seconds 5
  $i2 = Get-Item -LiteralPath $big -Force
  Write-Output ("  size={0:N0}  mtime={1}  grew_in_5s={2}" -f $i2.Length, $i2.LastWriteTime.ToString('s'), ($i2.Length - $i1.Length))
  if ($i2.Length -eq $i1.Length) {
    Remove-Item -LiteralPath $big -Force
    Report "[del] python traceback loop stdout" $i2.Length
  } else {
    Write-Output "  STILL GROWING - left alone"
  }
} else { Write-Output "  absent" }

Write-Output ""
Write-Output "=== approved cache-class items ==="
Purge-Dir 'C:\Users\hp\AppData\Roaming\Tencent\xwechat\xplugin' 'WeChat mini-program runtime plugins (re-downloadable)'
Purge-Dir 'C:\Users\hp\AppData\Roaming\Tencent\WeMeet\Global\Data' 'WeMeet Global\Data cache'
Purge-Dir 'C:\Users\hp\AppData\Local\Microsoft\Edge\User Data\ProvenanceData' 'Edge provenance component (327d stale)'
Purge-Dir 'C:\Users\hp\AppData\Local\Microsoft\Edge\User Data\Default\Cache' 'Edge http cache'
Purge-Dir 'C:\Users\hp\AppData\Local\Microsoft\Edge\User Data\Default\Code Cache' 'Edge code cache'
Purge-Dir 'C:\Users\hp\AppData\Local\Microsoft\Edge\User Data\Default\GPUCache' 'Edge gpu cache'
Purge-Dir 'C:\Users\hp\AppData\Local\Microsoft\Edge\User Data\GrShaderCache' 'Edge shader cache'
Purge-Dir 'C:\Users\hp\AppData\Local\Microsoft\Edge\User Data\component_crx_cache' 'Edge component crx cache'

Write-Output ""
Write-Output "=== C: free now ==="
Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' } | ForEach-Object {
  Write-Output ("C: free={0:N2} GB" -f ($_.FreeSpace/1GB))
  Add-Content -LiteralPath $log -Value ("free={0:N2} GB" -f ($_.FreeSpace/1GB))
}
Write-Output "=== PHASE3 DONE ==="
