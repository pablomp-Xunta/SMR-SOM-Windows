@echo off
REM 04_redes\exemplo.bat
REM Objetivo: diagnóstico IP, DNS, rutas y puertos.

ipconfig /all
echo.
ping 8.8.8.8 -n 4
echo.
nslookup www.microsoft.com
echo.
route print
echo.
netstat -ano | more
