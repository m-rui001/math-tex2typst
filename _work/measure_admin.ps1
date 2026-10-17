[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$log = 'E:\math\_work\measure_admin.log'
Set-Content -LiteralPath $log -Value ("admin measure start " + (Get-Date).ToString('s'))
function Say([string]$s) { Write-Output $s; Add-Content -LiteralPath $log -Value $s }

function Get-DirBytes([string]$path) {
  $sum = 0
  foreach ($f in (Get-ChildItem -LiteralPath $path -Recurse -Force -File -ErrorAction SilentlyContinue)) { $sum += $f.Length }
  return $sum
}

Say "=== C:\ level-1 dirs as ADMIN (GB) ==="
$total = 0
foreach ($d in (Get-ChildItem -LiteralPath 'C:\' -Force -Directory)) {
  $gb = (Get-DirBytes $d.FullName)/1GB
  $total += $gb
  Say ("{0,10:N2}  {1}" -f $gb, $d.Name)
}
Say ("  sum={0:N2} GB" -f $total)
Say ""
Say "=== C:\ level-1 files (GB) ==="
foreach ($f in (Get-ChildItem -LiteralPath 'C:\' -Force -File)) {
  Say ("{0,10:N2}  {1}" -f ($f.Length/1GB), $f.Name)
}
Say ""
Say "=== disk accounting ==="
$disk = Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' }
Say ("  C: total={0:N2} free={1:N2} used={2:N2}  accounted={3:N2}" -f ($disk.Size/1GB), ($disk.FreeSpace/1GB), (($disk.Size-$disk.FreeSpace)/1GB), $total)
Say ""
Say "=== VSS ==="
Say (vssadmin list shadows 2>&1 | Out-String)
Say ""
Say "=== DISM component store ANALYZE ==="
Say (dism /Online /Cleanup-Image /AnalyzeComponentStore 2>&1 | Out-String)
Say "=== DONE ==="
