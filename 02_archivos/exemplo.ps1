<#
02_archivos\exemplo.ps1
Objetivo: jerarquía, gestión de archivos/carpetas, redirección y pipes (objetos), permisos NTFS con icacls.
#>

# Preparar zona de práctica
$root = "C:\SMR\proyectos"
New-Item -ItemType Directory -Path $root -Force | Out-Null
Set-Location $root

# Crear archivos
"Hola SMR" | Out-File .\ejemplo.txt
"<html><body>Hola</body></html>" | Out-File .\index.html

# Listado detallado (incluye ocultos si -Force)
Get-ChildItem | Format-Table Name, Length, LastWriteTime

# Copiar y renombrar
Copy-Item .\index.html .\index_backup.html
Rename-Item .\ejemplo.txt notas.txt

# Búsqueda recursiva (ej.: html)
Get-ChildItem C:\SMR -Recurse -Filter *.html -ErrorAction SilentlyContinue

# Pipe con objetos: archivos > 1KB
Get-ChildItem . | Where-Object {$_.Length -gt 1KB} | Select-Object Name, Length

# Permisos NTFS: carpeta ENTREGAS
$entregas = "C:\AULA\ENTREGAS"
New-Item -ItemType Directory -Path $entregas -Force | Out-Null

# Quitar herencia y dar permisos (ejemplo con un usuario "alumno1" ya creado)
icacls $entregas /inheritance:r | Out-Null
icacls $entregas /grant "Administrators:(OI)(CI)F" | Out-Null
icacls $entregas /grant "alumno1:(OI)(CI)M" | Out-Null

icacls $entregas
Write-Host "Revisa permisos en $entregas (icacls)."
