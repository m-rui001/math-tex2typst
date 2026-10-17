[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = 'SilentlyContinue'
$log = 'E:\math\_work\admin2.log'
Set-Content -LiteralPath $log -Value ("admin2 start " + (Get-Date).ToString('s'))
function Say([string]$s) { Write-Output $s; Add-Content -LiteralPath $log -Value $s }

Say "=== C:\ level-1 files (GB) ==="
foreach ($f in (Get-ChildItem -LiteralPath 'C:\' -Force -File)) {
  Say ("{0,10:N2}  {1}" -f ($f.Length/1GB), $f.Name)
}
$d = Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' }
Say ("  C: total={0:N2} free={1:N2} used={2:N2}" -f ($d.Size/1GB), ($d.FreeSpace/1GB), (($d.Size-$d.FreeSpace)/1GB))

Say ""
Say "=== pagefile usage right now ==="
foreach ($p in (Get-CimInstance Win32_PageFileUsage)) {
  Say ("  {0} alloc={1} MB current={2} MB peak={3} MB" -f $p.Name, $p.AllocatedBaseSize, $p.CurrentUsage, $p.PeakUsage)
}
foreach ($p in (Get-CimInstance Win32_PageFileSetting)) {
  Say ("  setting: {0} initial={1} max={2}" -f $p.Name, $p.InitialSize, $p.MaximumSize)
}

Say ""
Say "=== hiberfil / sleep ==="
Say (powercfg /a | Select-Object -First 6 | Out-String)

Say ""
Say "=== DISM AnalyzeComponentStore ==="
Say (dism /Online /Cleanup-Image /AnalyzeComponentStore 2>&1 | Out-String)
Say "=== DONE ==="
