@echo off
REM 07_tareas\crear_tarea_backup.bat
REM Objetivo: crear tarea diaria con schtasks que ejecute un .bat de backup.
REM Requiere: Administrador.

mkdir C:\Scripts 2>nul
set SCRIPT=C:\Scripts\backup.bat

(
echo @echo off
echo set FECHA=%%DATE:~6,4%%%%DATE:~3,2%%%%DATE:~0,2%%_%%TIME:~0,2%%%%TIME:~3,2%%
echo set ORIGEN=C:\AULA
echo set DEST=C:\BACKUP\AULA_%%FECHA%%
echo mkdir C:\BACKUP 2^>nul
echo xcopy "%%ORIGEN%%" "%%DEST%%" /E /I /Y
) > %SCRIPT%

schtasks /create /tn "SMR_Backup_AULA" /tr "%SCRIPT%" /sc daily /st 19:00 /ru "SYSTEM" /f
schtasks /query /tn "SMR_Backup_AULA" /v /fo list
