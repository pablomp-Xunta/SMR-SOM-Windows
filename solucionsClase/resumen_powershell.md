# Resumen de comandos PowerShell

# 1. Mostrar información por pantalla

## Mostrar texto
```powershell
Write-Host "Hola mundo"
```

## Mostrar variables
```powershell
$nombre = "Pablo"
Write-Host $nombre
```

## Mostrar información del sistema
```powershell
Get-ComputerInfo
```

## Mostrar procesos
```powershell
Get-Process
```

## Mostrar servicios
```powershell
Get-Service
```

## Mostrar fecha y hora
```powershell
Get-Date
```

## Limpiar pantalla
```powershell
Clear-Host
```

o

```powershell
cls
```

---

# 2. Recoger entrada por teclado

## Pedir datos al usuario
```powershell
$nombre = Read-Host "Introduce tu nombre"
```

## Mostrar el dato introducido
```powershell
Write-Host "Hola $nombre"
```

## Pedir contraseña
```powershell
$pass = Read-Host "Introduce la contraseña" -AsSecureString
```

---

# 3. Gestión de usuarios y grupos

> Muchos comandos requieren ejecutar PowerShell como administrador.

## Usuarios locales

### Ver usuarios
```powershell
Get-LocalUser
```

### Crear usuario
```powershell
New-LocalUser "usuario1" -Password (Read-Host -AsSecureString)
```

### Cambiar contraseña
```powershell
Set-LocalUser usuario1 -Password (Read-Host -AsSecureString)
```

### Eliminar usuario
```powershell
Remove-LocalUser usuario1
```

### Deshabilitar usuario
```powershell
Disable-LocalUser usuario1
```

### Habilitar usuario
```powershell
Enable-LocalUser usuario1
```

---

## Grupos locales

### Ver grupos
```powershell
Get-LocalGroup
```

### Crear grupo
```powershell
New-LocalGroup "soporte"
```

### Añadir usuario a grupo
```powershell
Add-LocalGroupMember -Group "Administradores" -Member "usuario1"
```

### Ver miembros de un grupo
```powershell
Get-LocalGroupMember "Administradores"
```

### Eliminar usuario de grupo
```powershell
Remove-LocalGroupMember -Group "Administradores" -Member "usuario1"
```

---

# 4. Crear y gestionar carpetas y archivos

## Carpetas

### Crear carpeta
```powershell
New-Item -Path "C:\prueba" -ItemType Directory
```

### Cambiar de carpeta
```powershell
cd C:\prueba
```

### Mostrar contenido
```powershell
Get-ChildItem
```

o

```powershell
dir
```

### Eliminar carpeta
```powershell
Remove-Item "C:\prueba" -Recurse
```

---

## Archivos

### Crear archivo vacío
```powershell
New-Item archivo.txt -ItemType File
```

### Escribir contenido
```powershell
Set-Content archivo.txt "Hola"
```

### Añadir contenido
```powershell
Add-Content archivo.txt "Nueva línea"
```

### Leer archivo
```powershell
Get-Content archivo.txt
```

### Copiar archivo
```powershell
Copy-Item archivo.txt copia.txt
```

### Mover archivo
```powershell
Move-Item copia.txt C:\temp\
```

### Renombrar archivo
```powershell
Rename-Item archivo.txt nuevo.txt
```

### Eliminar archivo
```powershell
Remove-Item nuevo.txt
```

---

# 5. Gestión de discos con DiskPart

> DiskPart es una herramienta avanzada para administrar discos y particiones.

## Abrir DiskPart
```powershell
diskpart
```

## Mostrar discos
```powershell
list disk
```

## Seleccionar disco
```powershell
select disk 1
```

## Mostrar particiones
```powershell
list partition
```

## Crear partición primaria
```powershell
create partition primary
```

## Formatear partición
```powershell
format fs=ntfs quick
```

## Asignar letra
```powershell
assign letter=F
```

## Ver volúmenes
```powershell
list volume
```

## Eliminar partición
```powershell
delete partition
```

## Limpiar disco completo
⚠️ Borra TODO el contenido del disco.
```powershell
clean
```

## Salir de DiskPart
```powershell
exit
```

---

# 6. Diferencia entre alias, comandos y cmdlets

## Comandos

Un comando es cualquier instrucción que PowerShell puede ejecutar.

Puede ser:
- Cmdlet
- Alias
- Script
- Función
- Programa ejecutable

### Ejemplos
```powershell
Get-Process
```

```powershell
notepad.exe
```

---

## Cmdlets

Los cmdlets son comandos nativos de PowerShell.

Tienen formato:

```plaintext
Verbo-Sustantivo
```

### Características
- Devuelven objetos
- Sintaxis uniforme
- Diseñados para PowerShell

### Ejemplos
```powershell
Get-Process
Get-Service
New-Item
Get-Help
```

---

## Alias

Un alias es un nombre corto que apunta a otro comando.

### Ejemplos

| Alias | Cmdlet real |
|---|---|
| dir | Get-ChildItem |
| cls | Clear-Host |
| cat | Get-Content |
| cd | Set-Location |

---

## Ver alias existentes
```powershell
Get-Alias
```

## Ver un alias concreto
```powershell
Get-Alias dir
```

---

# Comparación rápida

| Tipo | Qué es | Ejemplo |
|---|---|---|
| Comando | Cualquier instrucción ejecutable | Get-Process |
| Cmdlet | Comando nativo PowerShell | Get-Service |
| Alias | Nombre corto de otro comando | dir |

---

# Ejemplo práctico

## Alias
```powershell
dir
```

## Cmdlet real
```powershell
Get-ChildItem
```

---

# Saber qué tipo de comando es

```powershell
Get-Command dir
```

```powershell
Get-Command Get-Process
```

PowerShell indicará si es:
- Alias
- Cmdlet
- Function
- Application
- Script

---

# 7. Ejemplo simple de script PowerShell

```powershell
Clear-Host

$nombre = Read-Host "Introduce tu nombre"

Write-Host "Hola $nombre"

New-Item -Path ".\carpeta_prueba" -ItemType Directory

Write-Host "Carpeta creada correctamente"
```
