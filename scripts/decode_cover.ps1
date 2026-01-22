Param(
    [string]$Source = "assets/cover.png.b64",
    [string]$Destination = "assets/cover.png"
)

if (-not (Test-Path $Source)) {
    Write-Error "Base64 source file not found: $Source"
    exit 1
}

$b64 = Get-Content -Raw -Path $Source
[System.IO.File]::WriteAllBytes($Destination, [System.Convert]::FromBase64String($b64))
Write-Output "Wrote $Destination"
