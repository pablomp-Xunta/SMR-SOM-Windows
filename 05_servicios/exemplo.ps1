<#
05_servicios\exemplo.ps1
Objetivo: listar, filtrar, iniciar/detener servicios y exportar inventario.
#>

# Listar servicios en ejecución
Get-Service | Where-Object Status -eq 'Running' | Sort-Object Name | Select-Object -First 30

# Ver uno concreto
Get-Service Spooler

# Detener e iniciar (ejemplo). OJO: Spooler afecta a impresión.
# Stop-Service Spooler
# Start-Service Spooler

# Inventario completo con datos avanzados (CIM)
New-Item -ItemType Directory -Path C:\temp -Force | Out-Null
Get-CimInstance Win32_Service |
Select-Object Name, State, StartMode, StartName, PathName |
Export-Csv C:\temp\inventario_servicios.csv -NoTypeInformation

Write-Host "Inventario exportado a C:\temp\inventario_servicios.csv"
