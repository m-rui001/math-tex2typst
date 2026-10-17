[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = 'SilentlyContinue'

function Get-DirSize([string]$path) {
  $sum = 0
  foreach ($f in (Get-ChildItem -LiteralPath $path -Recurse -Force -File)) { $sum += $f.Length }
  return $sum
}

Write-Output "=== DISKS ==="
Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 } | ForEach-Object {
  Write-Output ("{0} total={1:N1}GB free={2:N1}GB" -f $_.DeviceID, ($_.Size/1GB), ($_.FreeSpace/1GB))
}
Write-Output ""
Write-Output "=== C:\ level-1 dirs (GB) ==="
Get-ChildItem -LiteralPath 'C:\' -Force | Where-Object { $_.PSIsContainer } | ForEach-Object {
  Write-Output ("{0,10:N2}  {1}" -f ((Get-DirSize $_.FullName)/1GB), $_.Name)
}
Write-Output ""
Write-Output "=== C:\ level-1 files (GB) ==="
Get-ChildItem -LiteralPath 'C:\' -Force | Where-Object { -not $_.PSIsContainer } | ForEach-Object {
  Write-Output ("{0,10:N2}  {1}" -f ($_.Length/1GB), $_.Name)
}
Write-Output ""
Write-Output "=== C:\Users\hp level-1 dirs (GB) ==="
Get-ChildItem -LiteralPath 'C:\Users\hp' -Force | Where-Object { $_.PSIsContainer } | ForEach-Object {
  Write-Output ("{0,10:N2}  {1}" -f ((Get-DirSize $_.FullName)/1GB), $_.Name)
}
Write-Output ""
Write-Output "=== C:\Users\hp level-1 files (MB) ==="
Get-ChildItem -LiteralPath 'C:\Users\hp' -Force | Where-Object { -not $_.PSIsContainer } | ForEach-Object {
  Write-Output ("{0,10:N1}  {1}" -f ($_.Length/1MB), $_.Name)
}
Write-Output ""
Write-Output "=== DONE ==="
