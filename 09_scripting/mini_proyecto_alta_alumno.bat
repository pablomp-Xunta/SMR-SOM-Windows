@echo off
REM 09_scripting\mini_proyecto_alta_alumno.bat
REM Objetivo: mini-proyecto BAT: crear carpeta y aplicar icacls (usuario debe existir o crearse con net user).
REM Uso:
REM   mini_proyecto_alta_alumno.bat alumno1 P@ssw0rd

set USR=%1
set PASS=%2

if "%USR%"=="" (
  echo Uso: %0 usuario password
  exit /b 1
)

mkdir C:\temp 2>nul
echo == Alta de %USR% - %DATE% %TIME% == > C:\temp\alta_%USR%.log

REM Crear usuario (si no existe). Si ya existe, net user devuelve errorlevel != 0.
net user %USR% >nul 2>&1
if %errorlevel%==0 (
  echo Usuario ya existe >> C:\temp\alta_%USR%.log
) else (
  net user %USR% %PASS% /add >> C:\temp\alta_%USR%.log 2>&1
)

REM Crear carpeta y permisos
set BASE=C:\AULA\ALUMNOS
set RUTA=%BASE%\%USR%
mkdir %RUTA% 2>nul

icacls %RUTA% /inheritance:r >> C:\temp\alta_%USR%.log 2>&1
icacls %RUTA% /grant Administrators:(OI)(CI)F >> C:\temp\alta_%USR%.log 2>&1
icacls %RUTA% /grant %USR%:(OI)(CI)M >> C:\temp\alta_%USR%.log 2>&1

echo OK. Carpeta: %RUTA% >> C:\temp\alta_%USR%.log
echo Alta finalizada. Log: C:\temp\alta_%USR%.log
