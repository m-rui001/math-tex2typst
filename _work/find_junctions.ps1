[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = 'SilentlyContinue'

Write-Output "=== REPARSE POINTS (junction/symlink) under C:\Users\hp ==="
$found = Get-ChildItem -LiteralPath 'C:\Users\hp' -Recurse -Force -Attributes ReparsePoint
if (-not $found) { Write-Output "  none found by attribute scan" }
foreach ($i in $found) {
  $tgt = ($i.Target | Out-String).Trim()
  Write-Output ("  {0}  ->  {1}" -f $i.FullName, $tgt)
}

Write-Output ""
Write-Output "=== top-level: attributes of C:\Users\hp children ==="
Get-ChildItem -LiteralPath 'C:\Users\hp' -Force | ForEach-Object {
  $rp = if ($_.Attributes -match 'ReparsePoint') { 'REPARSE' } else { '' }
  Write-Output ("  {0,-32} {1}" -f $_.Attributes, $_.Name + ' ' + $rp)
}

Write-Output ""
Write-Output "=== junctions under AppData\Local and Roaming (attr scan only, no recursion into them) ==="
foreach ($root in @('C:\Users\hp\AppData\Local','C:\Users\hp\AppData\Roaming')) {
  Get-ChildItem -LiteralPath $root -Force | Where-Object { $_.Attributes -match 'ReparsePoint' } | ForEach-Object {
    Write-Output ("  {0}  ->  {1}" -f $_.FullName, (($_.Target | Out-String).Trim()))
  }
}
