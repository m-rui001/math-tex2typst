[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = 'SilentlyContinue'

function Get-DirSize([string]$path) {
  if (-not (Test-Path -LiteralPath $path)) { return -1 }
  $sum = 0
  foreach ($f in (Get-ChildItem -LiteralPath $path -Recurse -Force -File)) { $sum += $f.Length }
  return $sum
}

$targets = @(
  'C:\Windows\WinSxS',
  'C:\Windows\SoftwareDistribution',
  'C:\Windows\Temp',
  'C:\Windows\Installer',
  'C:\Windows\System32\DriverStore',
  'C:\Windows\MEMORY.DMP',
  'C:\ProgramData',
  'C:\$Recycle.Bin',
  'C:\Users\hp\AppData\Local',
  'C:\Users\hp\AppData\Roaming',
  'C:\Users\hp\AppData\LocalLow',
  'C:\Users\hp\Downloads',
  'C:\Users\hp\.qoder-cn',
  'C:\Users\hp\.vscode',
  'C:\Users\hp\.gradle',
  'C:\Users\hp\.m2',
  'C:\Users\hp\.npm',
  'C:\Users\hp\AppData\Local\npm-cache',
  'C:\Users\hp\AppData\Local\pip\Cache',
  'C:\Users\hp\AppData\Local\Temp'
)
Write-Output "=== KNOWN TARGETS (GB) ==="
foreach ($t in $targets) {
  $s = Get-DirSize $t
  if ($s -lt 0) { Write-Output ("     n/a  {0}" -f $t) }
  else { Write-Output ("{0,10:N2}  {1}" -f ($s/1GB), $t) }
}

Write-Output ""
Write-Output "=== AppData\Local level-2 (GB, desc) ==="
Get-ChildItem -LiteralPath 'C:\Users\hp\AppData\Local' -Force | Where-Object { $_.PSIsContainer } | ForEach-Object {
  [pscustomobject]@{ GB = (Get-DirSize $_.FullName)/1GB; Name = $_.Name }
} | Sort-Object GB -Descending | Select-Object -First 30 | ForEach-Object {
  Write-Output ("{0,10:N2}  {1}" -f $_.GB, $_.Name)
}

Write-Output ""
Write-Output "=== AppData\Roaming level-2 (GB, desc) ==="
Get-ChildItem -LiteralPath 'C:\Users\hp\AppData\Roaming' -Force | Where-Object { $_.PSIsContainer } | ForEach-Object {
  [pscustomobject]@{ GB = (Get-DirSize $_.FullName)/1GB; Name = $_.Name }
} | Sort-Object GB -Descending | Select-Object -First 30 | ForEach-Object {
  Write-Output ("{0,10:N2}  {1}" -f $_.GB, $_.Name)
}
