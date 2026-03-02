<#
01_entornos\exemplo.ps1
Objetivo: conocer terminales, ayuda, exportación de información y diferencias con CMD.
#>

# Mostrar versión de PowerShell y del sistema
$PSVersionTable
(Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsArchitecture)

# Descubrir comandos y ayuda
Get-Command *service* | Select-Object -First 10
Get-Help Get-ChildItem -Examples

# Guardar un "informe" básico a ficheros
New-Item -ItemType Directory -Path C:\temp -Force | Out-Null

systeminfo | Out-File C:\temp\systeminfo.txt
Get-Process | Sort-Object CPU -Descending | Select-Object -First 20 | Out-File C:\temp\top_cpu.txt
Get-Service | Where-Object Status -eq 'Running' | Out-File C:\temp\services_running.txt

Write-Host "Archivos creados en C:\temp (systeminfo.txt, top_cpu.txt, services_running.txt)"

# Extra: diferencia pipe texto vs objetos
# CMD pasa texto; PowerShell pasa objetos
Get-Process | Get-Member | Select-Object -First 10
