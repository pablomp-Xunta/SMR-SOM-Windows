@echo off
REM 06_procesos\exemplo.bat
REM Objetivo: listar procesos y finalizar.

tasklist
echo.
tasklist | find "notepad"
echo.
REM taskkill /im notepad.exe /f
