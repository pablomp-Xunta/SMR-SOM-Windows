<#
07_tareas\crear_tarea_backup.ps1
Objetivo: crear una tarea programada diaria que ejecute un backup PowerShell.
Requiere: ejecutar como Administrador.
#>

# 1) Crear script de backup sencillo si no existe
New-Item -ItemType Directory -Path C:\Scripts -Force | Out-Null
$backupScript = "C:\Scripts\backup.ps1"

@'
$fecha = Get-Date -Format "yyyyMMdd_HHmm"
$origen = "C:\AULA"
$destino = "C:\BACKUP\AULA_$fecha"
New-Item -ItemType Directory -Path (Split-Path $destino) -Force | Out-Null
Copy-Item $origen -Destination $destino -Recurse -Force
'@ | Out-File $backupScript -Encoding UTF8 -Force

# 2) Crear acción y trigger
$accion  = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$backupScript`""
$trigger = New-ScheduledTaskTrigger -Daily -At 19:00

# 3) Registrar tarea
Register-ScheduledTask -TaskName "SMR_Backup_AULA" -Action $accion -Trigger $trigger -RunLevel Highest -Force

Get-ScheduledTask -TaskName "SMR_Backup_AULA"
Write-Host "Tarea creada: SMR_Backup_AULA (diaria 19:00)."
