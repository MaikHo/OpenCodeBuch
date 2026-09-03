param(
    [Parameter(Position = 0)]
    [string]$Root = "."
)

$resolvedRoot = Resolve-Path -Path $Root -ErrorAction Stop

$files = Get-ChildItem -Path $resolvedRoot -File -Recurse -ErrorAction SilentlyContinue |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]' -and
        $_.FullName -notmatch '[\\/]bin[\\/]' -and
        $_.FullName -notmatch '[\\/]obj[\\/]'
    }

Write-Output "# Projektinventur"
Write-Output ""
Write-Output "Root: $resolvedRoot"
Write-Output ""
Write-Output "## Dateitypen"

$files |
    Group-Object { if ($_.Extension) { $_.Extension.ToLowerInvariant() } else { "[ohne Endung]" } } |
    Sort-Object Name |
    ForEach-Object { "{0}`t{1}" -f $_.Name, $_.Count }

Write-Output ""
Write-Output "## Größte Dateien"

$files |
    Sort-Object Length -Descending |
    Select-Object -First 20 |
    ForEach-Object { "{0}`t{1}" -f $_.Length, $_.FullName }
