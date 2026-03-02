<#
08_software\instalacion_base.ps1
Objetivo: instalar software base con winget (si está disponible).
#>

$apps = @(
  "7zip.7zip",
  "VideoLAN.VLC",
  "Google.Chrome",
  "Microsoft.VisualStudioCode"
)

foreach ($app in $apps) {
  Write-Host "Instalando $app..."
  winget install $app -e --silent --accept-package-agreements --accept-source-agreements
}

Write-Host "Fin. Revisa: winget list"
