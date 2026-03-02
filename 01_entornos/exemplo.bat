@echo off
REM 01_entornos\exemplo.bat
REM Objetivo: ayuda de comandos, exportación de información y comandos clásicos.

mkdir C:\temp 2>nul

REM Version/Info del sistema
systeminfo > C:\temp\systeminfo_cmd.txt

REM Lista de procesos (texto)
tasklist > C:\temp\tasklist.txt

REM Servicios (texto). En algunos equipos WMIC puede estar deprecado, pero suele existir en Win10.
sc query type= service state= all > C:\temp\services_sc.txt

REM Red (texto)
ipconfig /all > C:\temp\ipconfig.txt

echo Archivos creados en C:\temp (systeminfo_cmd.txt, tasklist.txt, services_sc.txt, ipconfig.txt)
echo.
echo Ayuda rapida:
echo   dir /?
echo   help
