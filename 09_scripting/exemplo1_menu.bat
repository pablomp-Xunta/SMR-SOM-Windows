@echo off
REM 09_scripting\exemplo1_menu.bat
REM Objetivo: menú simple en BAT (limitado), usando herramientas clásicas.

:menu
echo 1) Ver IP
echo 2) Ver top procesos (tasklist)
echo 3) Guardar servicios (sc) a archivo
echo 0) Salir
set /p op=Elige opcion:

if "%op%"=="1" goto ip
if "%op%"=="2" goto proc
if "%op%"=="3" goto serv
if "%op%"=="0" goto fin
goto menu

:ip
ipconfig /all
pause
goto menu

:proc
tasklist | more
pause
goto menu

:serv
mkdir C:\temp 2>nul
sc query type= service state= all > C:\temp\services_sc.txt
echo Exportado C:\temp\services_sc.txt
pause
goto menu

:fin
echo Saliendo...
