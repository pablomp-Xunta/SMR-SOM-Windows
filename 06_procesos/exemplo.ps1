<#
06_procesos\exemplo.ps1
Objetivo: listar procesos, top consumo y finalizar.
#>

# Top CPU (acumulado)
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, Id, CPU, WorkingSet

# Top RAM
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 10 Name, Id, WorkingSet

# Guardar a CSV
New-Item -ItemType Directory -Path C:\temp -Force | Out-Null
Get-Process | Select-Object Name, Id, CPU, WorkingSet, StartTime -ErrorAction SilentlyContinue |
Export-Csv C:\temp\procesos.csv -NoTypeInformation

Write-Host "Exportado C:\temp\procesos.csv"

# Parar un proceso (ejemplo)
# Stop-Process -Name notepad -Force
