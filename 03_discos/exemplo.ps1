<#
03_discos\exemplo.ps1
Objetivo: inventario de discos/volúmenes y práctica segura con VHDX.
Requiere: ejecutar como Administrador.
#>

# Inventario
Get-Disk | Select-Object Number, FriendlyName, Size, PartitionStyle, OperationalStatus
Get-Volume | Select-Object DriveLetter, FileSystemLabel, FileSystem, SizeRemaining, Size

# Crear VHDX dinámico de 5GB, montarlo, inicializarlo y formatearlo
$vhddir = "C:\VHD"
New-Item -ItemType Directory -Path $vhddir -Force | Out-Null
$vhd = Join-Path $vhddir "SMR_Prueba.vhdx"

New-VHD -Path $vhd -SizeBytes 5GB -Dynamic | Out-Null
Mount-VHD -Path $vhd

# Localizar el disco recién montado (el último "Unknown" o "RAW" suele ser)
$disk = Get-Disk | Where-Object PartitionStyle -eq 'RAW' | Sort-Object Number | Select-Object -Last 1
Initialize-Disk -Number $disk.Number -PartitionStyle GPT

$part = New-Partition -DiskNumber $disk.Number -UseMaximumSize -AssignDriveLetter
Format-Volume -Partition $part -FileSystem NTFS -NewFileSystemLabel "DATOS_SMR" -Confirm:$false

Get-Volume -DriveLetter $part.DriveLetter
Write-Host "VHDX listo en $vhd (montado como unidad $($part.DriveLetter):)."
