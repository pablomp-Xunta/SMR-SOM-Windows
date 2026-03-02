<#
09_scripting\mini_proyecto_alta_alumno.ps1
Objetivo: mini-proyecto SMR: alta de alumno + carpeta + permisos + log.
Requiere: Administrador.
Uso:
  .\mini_proyecto_alta_alumno.ps1 -Usuario alumno1 -PasswordPlano 'P@ssw0rd'
#>

param(
  [Parameter(Mandatory=$true)][string]$Usuario,
  [Parameter(Mandatory=$true)][string]$PasswordPlano
)

$logDir = "C:\temp"
New-Item -ItemType Directory -Path $logDir -Force | Out-Null
$log = Join-Path $logDir ("alta_{0}.log" -f $Usuario)

"== Alta de $Usuario - $(Get-Date) ==" | Out-File $log -Encoding UTF8

try {
  if (Get-LocalUser -Name $Usuario -ErrorAction SilentlyContinue) {
    "Usuario ya existe." | Out-File $log -Append
    Write-Host "Usuario ya existe."
    exit 1
  }

  $pass = ConvertTo-SecureString $PasswordPlano -AsPlainText -Force
  New-LocalUser -Name $Usuario -Password $pass -PasswordNeverExpires:$true | Out-Null
  Add-LocalGroupMember -Group "Users" -Member $Usuario

  $rutaBase = "C:\AULA\ALUMNOS"
  $rutaUser = Join-Path $rutaBase $Usuario
  New-Item -ItemType Directory -Path $rutaUser -Force | Out-Null

  icacls $rutaUser /inheritance:r | Out-Null
  icacls $rutaUser /grant "Administrators:(OI)(CI)F" | Out-Null
  icacls $rutaUser /grant "$Usuario:(OI)(CI)M" | Out-Null

  "OK. Carpeta: $rutaUser" | Out-File $log -Append
  Write-Host "Alta completada. Log: $log"
}
catch {
  "ERROR: $($_.Exception.Message)" | Out-File $log -Append
  throw
}
