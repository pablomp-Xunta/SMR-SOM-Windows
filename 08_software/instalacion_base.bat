@echo off
REM 08_software\instalacion_base.bat
REM Objetivo: instalar software base con winget (si está disponible).

for %%A in (7zip.7zip VideoLAN.VLC Google.Chrome Microsoft.VisualStudioCode) do (
  echo Instalando %%A...
  winget install %%A -e --silent --accept-package-agreements --accept-source-agreements
)

echo Fin. Revisa: winget list
