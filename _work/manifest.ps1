[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = 'SilentlyContinue'

function Get-DirSize([string]$path) {
  $sum = 0
  foreach ($f in (Get-ChildItem -LiteralPath $path -Recurse -Force -File)) { $sum += $f.Length }
  return $sum
}

function Show-Children([string]$parent, [int]$top) {
  if (-not (Test-Path -LiteralPath $parent)) { Write-Output ("  [absent] " + $parent); return }
  Write-Output ("--- " + $parent)
  Get-ChildItem -LiteralPath $parent -Force | ForEach-Object {
    $mb = if ($_.PSIsContainer) { (Get-DirSize $_.FullName)/1MB } else { $_.Length/1MB }
    [pscustomobject]@{ MB = $mb; Age = ((Get-Date) - $_.LastWriteTime).TotalDays; Name = $_.Name; IsDir = $_.PSIsContainer }
  } | Sort-Object MB -Descending | Select-Object -First $top | ForEach-Object {
    $tag = if ($_.IsDir) { 'd' } else { 'f' }
    Write-Output ("  {0,9:N0} MB  age={1,6:N1}d  [{2}] {3}" -f $_.MB, $_.Age, $tag, $_.Name)
  }
}

Write-Output "=== FREE SPACE NOW ==="
Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' } | ForEach-Object {
  Write-Output ("C: free={0:N2} GB" -f ($_.FreeSpace/1GB))
}

Write-Output ""
Write-Output "=== RELEVANT RUNNING PROCESSES ==="
$pat = 'quark|wechat|xwechat|wemeet|msedge|chrome|Code|Trae|matlab|MathWorks|node|bun|codex|zcode|marscode|workbuddy|qoder|java|Xftp|Xshell'
Get-Process | Where-Object { $_.ProcessName -match $pat } | Group-Object ProcessName | Sort-Object Count -Descending | ForEach-Object {
  Write-Output ("  {0,3} x {1}" -f $_.Count, $_.Name)
}

Show-Children 'C:\Users\hp\.bun' 10
Show-Children 'C:\Users\hp\.codex' 12
Show-Children 'C:\Users\hp\.zcode' 12
Show-Children 'C:\Users\hp\.marscode' 12
Show-Children 'C:\Users\hp\.workbuddy' 10
Show-Children 'C:\Users\hp\.cache' 8
Show-Children 'C:\Users\hp\AppData\Roaming\Tencent\xwechat' 10
Show-Children 'C:\Users\hp\AppData\Roaming\Tencent\WeChat' 10
Show-Children 'C:\Users\hp\AppData\Roaming\Tencent\WeMeet' 10
Show-Children 'C:\Users\hp\AppData\Local\Microsoft\Edge\User Data' 14
Show-Children 'C:\Users\hp\AppData\Local\MathWorks' 10
Show-Children 'C:\Users\hp\AppData\Roaming\Code\User\globalStorage\saoudrizwan.claude-dev' 8
Show-Children 'C:\Users\hp\AppData\Local\Programs\Quark' 10
Show-Children 'C:\Users\hp\AppData\Local\Quark\User Data\updates' 10
Show-Children 'C:\Users\hp\Documents\NetSarang Computer\8\Xftp\Temporary\online1\mengxr\KoopmanLab\data' 6

Write-Output ""
Write-Output "=== .qoder-cn\logs age buckets ==="
foreach ($sub in @('runs','sessions')) {
  $r = 'C:\Users\hp\.qoder-cn\logs\' + $sub
  if (-not (Test-Path -LiteralPath $r)) { continue }
  $items = Get-ChildItem -LiteralPath $r -Force
  $today = (Get-Date).Date
  $old = $items | Where-Object { $_.LastWriteTime -lt $today }
  $keep = $items | Where-Object { $_.LastWriteTime -ge $today }
  $oldMB = 0
  foreach ($i in $old) {
    if ($i.PSIsContainer) { $oldMB += Get-DirSize $i.FullName } else { $oldMB += $i.Length }
  }
  Write-Output ("  {0}: total={1} items  older-than-today={2} ({3:N0} MB)  today={4}" -f $sub, $items.Count, $old.Count, ($oldMB/1MB), $keep.Count)
}

Write-Output ""
Write-Output "=== Temp top-level (age, MB) ==="
Get-ChildItem -LiteralPath 'C:\Users\hp\AppData\Local\Temp' -Force | ForEach-Object {
  $mb = if ($_.PSIsContainer) { (Get-DirSize $_.FullName)/1MB } else { $_.Length/1MB }
  [pscustomobject]@{ MB = $mb; Age = ((Get-Date) - $_.LastWriteTime).TotalDays; Name = $_.Name }
} | Sort-Object MB -Descending | Select-Object -First 18 | ForEach-Object {
  Write-Output ("  {0,9:N0} MB  age={1,6:N1}d  {2}" -f $_.MB, $_.Age, $_.Name)
}

Write-Output ""
Write-Output "=== updater / leftover installer dirs ==="
foreach ($t in @('C:\Users\hp\AppData\Local\@genieworkbuddy-desktop-updater','C:\Users\hp\AppData\Local\@zcodedesktop-updater','C:\Users\hp\AppData\Local\qoder-updater','C:\Users\hp\AppData\Local\qoder-cn-updater','C:\Users\hp\AppData\Local\eleckoi-desktop-updater','C:\Users\hp\AppData\Roaming\Code\CachedExtensionVSIXs','C:\Users\hp\AppData\Roaming\Tencent\WeMeet\Global\UpdatePackages','C:\Users\hp\AppData\Local\javasharedresources','C:\Users\hp\AppData\Local\NRC','C:\Users\hp\AppData\Local\Microsoft\vscode-cpptools','C:\Users\hp\AppData\Local\npm-cache','C:\Users\hp\AppData\Local\pip\Cache')) {
  if (Test-Path -LiteralPath $t) { Write-Output ("  {0,9:N0} MB  {1}" -f ((Get-DirSize $t)/1MB), $t) }
}

Write-Output ""
Write-Output "=== DONE ==="
