<#
04_redes\exemplo.ps1
Objetivo: diagnóstico de conectividad, DNS, rutas y puertos.
#>

# Config IP
Get-NetIPConfiguration

# Ping (ICMP)
Test-Connection 8.8.8.8 -Count 4

# DNS
Resolve-DnsName www.microsoft.com | Select-Object -First 5

# Rutas
Get-NetRoute -AddressFamily IPv4 | Sort-Object RouteMetric | Select-Object -First 10

# Puertos (equivalente moderno de netstat)
Get-NetTCPConnection -State Listen | Select-Object -First 20 LocalAddress, LocalPort, OwningProcess

# Verificar puerto remoto (ej.: 80)
Test-NetConnection -ComputerName www.microsoft.com -Port 443
