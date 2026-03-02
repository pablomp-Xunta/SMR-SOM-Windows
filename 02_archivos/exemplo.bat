@echo off
REM 02_archivos\exemplo.bat
REM Objetivo: jerarquía, gestión de archivos/carpetas, redirección y pipes (texto), permisos con icacls.

set ROOT=C:\SMR\proyectos
mkdir %ROOT% 2>nul
cd /d %ROOT%

echo Hola SMR > ejemplo.txt
echo ^<html^>^<body^>Hola^</body^>^</html^> > index.html

dir

copy index.html index_backup.html >nul
ren ejemplo.txt notas.txt

REM Buscar html dentro de C:\SMR
dir C:\SMR\*.html /s /b

REM Pipe de texto: encontrar una palabra
type index.html | find "Hola"

REM Permisos NTFS (requiere usuario alumno1 existente)
set ENTREGAS=C:\AULA\ENTREGAS
mkdir %ENTREGAS% 2>nul
icacls %ENTREGAS% /inheritance:r >nul
icacls %ENTREGAS% /grant Administrators:(OI)(CI)F >nul
icacls %ENTREGAS% /grant alumno1:(OI)(CI)M >nul

icacls %ENTREGAS%
echo Revisa permisos en %ENTREGAS%
