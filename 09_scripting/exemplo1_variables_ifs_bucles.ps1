<#
09_scripting\exemplo1_variables_ifs_bucles.ps1
Objetivo: repaso: variables, entrada, condicionales, bucles, funciones y exportación.
#>

function Mostrar-Menu {
  Write-Host "1) Ver IP"
  Write-Host "2) Ver top CPU"
  Write-Host "3) Exportar servicios detenidos a CSV"
  Write-Host "0) Salir"
}

do {
  Mostrar-Menu
  $op = Read-Host "Elige opción"
  switch ($op) {
    "1" { Get-NetIPConfiguration | Format-List }
    "2" { Get-Process | Sort CPU -Descending | Select -First 10 | Format-Table -AutoSize }
    "3" {
      New-Item -ItemType Directory -Path C:\temp -Force | Out-Null
      Get-Service | Where Status -eq 'Stopped' | Select Name, DisplayName |
        Export-Csv C:\temp\servicios_detenidos.csv -NoTypeInformation
      Write-Host "Exportado a C:\temp\servicios_detenidos.csv"
    }
  }
} while ($op -ne "0")
