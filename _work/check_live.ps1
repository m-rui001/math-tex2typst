[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$cs = Get-CimInstance Win32_ComputerSystem
Write-Output ("RAM_GB=" + [math]::Round($cs.TotalPhysicalMemory/1GB,1))
$p = 'C:\Users\hp\AppData\Local\Temp\qoder-cli-cn\E--math\cd5786df-ab20-47eb-8821-405d0c904858\tasks\b3j93hpcc.output'
$f = Get-Item -LiteralPath $p -Force
Write-Output ("big_file_GB=" + [math]::Round($f.Length/1GB,2))
Write-Output ("mtime=" + $f.LastWriteTime.ToString('s') + "  now=" + (Get-Date).ToString('s'))
Start-Sleep -Seconds 6
Write-Output ("size_after_6s_GB=" + [math]::Round((Get-Item -LiteralPath $p -Force).Length/1GB,3))
Write-Output ""
Write-Output "=== largest files under Temp\qoder-cli-cn ==="
Get-ChildItem -LiteralPath 'C:\Users\hp\AppData\Local\Temp\qoder-cli-cn' -Recurse -Force -File |
  Sort-Object Length -Descending | Select-Object -First 12 | ForEach-Object {
    Write-Output ("{0,8:N0} MB  mtime={1}  {2}" -f ($_.Length/1MB), $_.LastWriteTime.ToString('MM-dd_HH:mm'), $_.FullName.Substring(46))
  }
Write-Output ""
Write-Output "=== node/powershell processes ==="
Get-Process | Where-Object { $_.ProcessName -match 'node|qoder' } | Group-Object ProcessName | ForEach-Object {
  Write-Output ("{0,4} x {1}" -f $_.Count, $_.Name)
}
