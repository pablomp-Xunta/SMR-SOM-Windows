@echo off
REM 05_servicios\exemplo.bat
REM Objetivo: gestionar servicios con sc.exe

sc query state= running
echo.
sc query "Spooler"
echo.
REM sc stop "Spooler"
REM sc start "Spooler"
echo.
sc qc "Spooler"
