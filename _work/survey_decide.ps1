[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = 'SilentlyContinue'

function Get-DirSize([string]$path) {
  $sum = 0
  foreach ($f in (Get-ChildItem -LiteralPath $path -Recurse -Force -File)) { $sum += $f.Length }
  return $sum
}

Write-Output "=== RAM / VM ==="
$os = Get-CimInstance Win32_OperatingSystem
Write-Output ("RAM total={0:N1} GB  free={1:N1} GB" -f ($os.TotalPhysicalMemory/1MB), ($os.FreePhysicalMemory/1MB))
foreach ($c in (Get-CimInstance Win32_PageFileUsage)) {
  Write-Output ("pagefile: {0}  alloc={1} MB  peak={2} MB" -f $c.Name, $c.AllocatedBaseSize, $c.CurrentUsage)
}
foreach ($s in (Get-CimInstance Win32_ComputerSystem)) {
  Write-Output ("AutomaticManagedPagefile={0}" -f $s.AutomaticManagedPagefile)
}

Write-Output ""
Write-Output "=== HIBERNATION STATE ==="
powercfg /a | Select-Object -First 12

Write-Output ""
Write-Output "=== Temp\qoder-cli-cn : session dirs (MB, age days) ==="
$root = 'C:\Users\hp\AppData\Local\Temp\qoder-cli-cn'
Get-ChildItem -LiteralPath $root -Force -Directory | ForEach-Object {
  $mb = (Get-DirSize $_.FullName)/1MB
  $age = ((Get-Date) - $_.LastWriteTime).TotalDays
  [pscustomobject]@{ MB = $mb; AgeDays = $age; Name = $_.Name }
} | Sort-Object MB -Descending | Select-Object -First 12 | ForEach-Object {
  Write-Output ("{0,9:N0} MB  age={1,6:N1}d  session={2}" -f $_.MB, $_.AgeDays, $_.Name)
}
Write-Output ""
Write-Output "total sessions: " + (Get-ChildItem -LiteralPath $root -Force -Directory).Count
Write-Output "sessions older than 3 days: " + ((Get-ChildItem -LiteralPath $root -Force -Directory | Where-Object { ((Get-Date) - $_.LastWriteTime).TotalDays -gt 3 })).Count
Write-Output ("MB in sessions older than 3 days: {0:N0}" -f (((Get-ChildItem -LiteralPath $root -Force -Directory | Where-Object { ((Get-Date) - $_.LastWriteTime).TotalDays -gt 3 }) | ForEach-Object { Get-DirSize $_.FullName } | Measure-Object -Sum).Sum/1MB))

Write-Output ""
Write-Output "=== .qoder-cn\logs breakdown ==="
Get-ChildItem -LiteralPath 'C:\Users\hp\.qoder-cn\logs' -Force | ForEach-Object {
  $mb = if ($_.PSIsContainer) { (Get-DirSize $_.FullName)/1MB } else { $_.Length/1MB }
  [pscustomobject]@{ MB = $mb; Name = $_.Name }
} | Sort-Object MB -Descending | Select-Object -First 6 | ForEach-Object { Write-Output ("{0,9:N0} MB  {1}" -f $_.MB, $_.Name) }
$runs = 'C:\Users\hp\.qoder-cn\logs\runs'
if (Test-Path -LiteralPath $runs) {
  Write-Output ("run dirs total={0}  older than 7d={1}" -f (Get-ChildItem -LiteralPath $runs -Force -Directory).Count, (Get-ChildItem -LiteralPath $runs -Force -Directory | Where-Object { ((Get-Date) - $_.LastWriteTime).TotalDays -gt 7 }).Count)
}

Write-Output ""
Write-Output "=== C:\Users\hp\.cache breakdown (MB) ==="
Get-ChildItem -LiteralPath 'C:\Users\hp\.cache' -Force | ForEach-Object {
  $mb = if ($_.PSIsContainer) { (Get-DirSize $_.FullName)/1MB } else { $_.Length/1MB }
  [pscustomobject]@{ MB = $mb; Name = $_.Name }
} | Sort-Object MB -Descending | Select-Object -First 12 | ForEach-Object { Write-Output ("{0,9:N0} MB  {1}" -f $_.MB, $_.Name) }

Write-Output ""
Write-Output "=== Documents\NetSarrer Xftp Temporary ==="
foreach ($t in @('C:\Users\hp\Documents\NetSarang Computer\8\Xftp\Temporary')) {
  if (Test-Path -LiteralPath $t) { Write-Output ("{0:N2} GB  {1}" -f ((Get-DirSize $t)/1GB), $t) }
}
Get-ChildItem -LiteralPath 'C:\Users\hp\Documents' -Force -Directory | ForEach-Object {
  [pscustomobject]@{ MB = (Get-DirSize $_.FullName)/1MB; Name = $_.Name }
} | Sort-Object MB -Descending | Select-Object -First 8 | ForEach-Object { Write-Output ("{0,9:N0} MB  {1}" -f $_.MB, $_.Name) }

Write-Output ""
Write-Output "=== Quark versions in Programs\Quark ==="
Get-ChildItem -LiteralPath 'C:\Users\hp\AppData\Local\Programs\Quark' -Force -Directory | ForEach-Object {
  Write-Output ("{0,9:N0} MB  {1}" -f ((Get-DirSize $_.FullName)/1MB), $_.Name)
}

Write-Output ""
Write-Output "=== pip / npm / uv caches ==="
foreach ($t in @('C:\Users\hp\AppData\Local\pip\Cache','C:\Users\hp\AppData\Local\npm-cache','C:\Users\hp\AppData\Roaming\npm-cache','C:\Users\hp\AppData\Local\uv','C:\Users\hp\.bun','C:\Users\hp\AppData\Local\Microsoft\vscode-cpptools','C:\Users\hp\AppData\Roaming\Code\Cache','C:\Users\hp\AppData\Roaming\Code\CachedExtensionVSIXs','C:\Users\hp\AppData\Roaming\Code\User\globalStorage\saoudrizwan.claude-dev','C:\Users\hp\AppData\Local\Microsoft\Edge','C:\Users\hp\.codex','C:\Users\hp\.marscode','C:\Users\hp\.zcode','C:\Users\hp\.workbuddy','C:\Users\hp\.android','C:\Users\hp\AppData\Local\MathWorks','C:\Users\hp\AppData\Local\NRC','C:\Users\hp\AppData\Local\@genieworkbuddy-desktop-updater','C:\Users\hp\AppData\Local\javasharedresources')) {
  if (Test-Path -LiteralPath $t) { Write-Output ("{0,9:N0} MB  {1}" -f ((Get-DirSize $t)/1MB), $t) }
}
Write-Output ""
Write-Output "=== DONE ==="
