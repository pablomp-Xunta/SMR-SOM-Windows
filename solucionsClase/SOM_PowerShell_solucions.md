![IES Castro da Uz](https://www.edu.xunta.gal/centros/iescastrodauz/system/files/zeropoint3_logo.jpg)

# PowerShell — Resumo de comandos

> Execución recomendada con PowerShell aberto como **Administrador**.

---

## Parte 1 — Mostrar información por pantalla

**1. Mostrar un texto fixo na pantalla.**

```powershell
Write-Host "Hola mundo"
```

> `Write-Host` escribe directamente na consola. Non devolve obxectos; só imprime texto.

---

**2. Mostrar o valor dunha variable.**

```powershell
$nome = "Pablo"
Write-Host $nome
```

> As variables en PowerShell comezan sempre por `$`.

---

**3. Mostrar información xeral do sistema.**

```powershell
Get-ComputerInfo
```

> Devolve un obxecto con propiedades do equipo: SO, BIOS, CPU, memoria, etc.

---

**4. Mostrar os procesos en execución.**

```powershell
Get-Process
```

> Lista todos os procesos activos coa súa PID, uso de CPU e memoria.

---

**5. Mostrar os servizos do sistema.**

```powershell
Get-Service
```

> Mostra o nome, estado (`Running`, `Stopped`) e nome de visualización de cada servizo.

---

**6. Mostrar a data e hora actuais.**

```powershell
Get-Date
```

> Devolve un obxecto `DateTime`. Pódese formatar con `-Format "dd/MM/yyyy HH:mm"`.

---

**7. Limpar a pantalla da consola.**

```powershell
Clear-Host
```

> Equivalente ao alias `cls`, que tamén é válido en PowerShell.

---

## Parte 2 — Recoller entrada por teclado

**1. Pedir un dato ao usuario.**

```powershell
$nome = Read-Host "Introduce o teu nome"
```

> `Read-Host` pausa a execución e agarda a que o usuario escriba. O valor gárdase na variable indicada.

---

**2. Mostrar o dato introducido.**

```powershell
Write-Host "Ola $nome"
```

> PowerShell interpola variables directamente dentro de cadeas con comiñas dobres `"..."`.

---

**3. Pedir un contrasinal de forma segura.**

```powershell
$pass = Read-Host "Introduce o contrasinal" -AsSecureString
```

> `-AsSecureString` oculta os caracteres mentres se escriben e almacena o valor como `SecureString`, non como texto plano.

---

## Parte 3 — Xestión de usuarios e grupos locais

**1. Ver os usuarios locais do equipo.**

```powershell
Get-LocalUser
```

> Lista todos os usuarios locais: nome, estado (activo/inactivo) e descrición.

---

**2. Crear un novo usuario local.**

```powershell
New-LocalUser "usuario1" -Password (Read-Host -AsSecureString)
```

> `New-LocalUser` crea o usuario. O contrasinal pídeselle ao administrador de forma segura mediante `Read-Host -AsSecureString`.

---

**3. Cambiar o contrasinal dun usuario.**

```powershell
Set-LocalUser usuario1 -Password (Read-Host -AsSecureString)
```

> `Set-LocalUser` modifica propiedades do usuario. O parámetro `-Password` require un `SecureString`.

---

**4. Eliminar un usuario local.**

```powershell
Remove-LocalUser usuario1
```

> Elimina o usuario do sistema. Non elimina automaticamente o seu directorio de perfil.

---

**5. Deshabilitar un usuario (sen eliminalo).**

```powershell
Disable-LocalUser usuario1
```

> O usuario queda na lista pero non pode iniciar sesión mentres estea deshabilitado.

---

**6. Habilitar un usuario previamente deshabilitado.**

```powershell
Enable-LocalUser usuario1
```

> Restaura o acceso do usuario ao sistema.

---

**7. Ver os grupos locais do equipo.**

```powershell
Get-LocalGroup
```

> Lista todos os grupos locais: `Administradores`, `Usuarios`, etc.

---

**8. Crear un novo grupo local.**

```powershell
New-LocalGroup "soporte"
```

> Crea un grupo baleiro. Os membros engádense despois con `Add-LocalGroupMember`.

---

**9. Engadir un usuario a un grupo.**

```powershell
Add-LocalGroupMember -Group "Administradores" -Member "usuario1"
```

> `-Group` indica o grupo destino e `-Member` o usuario que se engade. Require privilexios de administrador.

---

**10. Ver os membros dun grupo.**

```powershell
Get-LocalGroupMember "Administradores"
```

> Mostra o nome, tipo de obxecto (usuario, grupo) e o SID de cada membro.

---

**11. Eliminar un usuario dun grupo.**

```powershell
Remove-LocalGroupMember -Group "Administradores" -Member "usuario1"
```

> Retira ao usuario do grupo sen eliminalo do sistema.

---

## Parte 4 — Xestión de carpetas e arquivos

**1. Crear unha carpeta nova.**

```powershell
New-Item -Path "C:\proba" -ItemType Directory
```

> `-ItemType Directory` indica que se crea un directorio. Para arquivos úsase `File`.

---

**2. Cambiar ao directorio de traballo.**

```powershell
cd C:\proba
```

> `cd` é un alias de `Set-Location`. Cambia o directorio de traballo actual.

---

**3. Mostrar o contido dunha carpeta.**

```powershell
Get-ChildItem
```

> Equivalente ao alias `dir`. Lista arquivos e subcarpetas do directorio actual.

---

**4. Eliminar unha carpeta e todo o seu contido.**

```powershell
Remove-Item "C:\proba" -Recurse
```

> `-Recurse` é obrigatorio para eliminar carpetas con contido. Sen el, PowerShell pregunta confirmación.

---

**5. Crear un arquivo baleiro.**

```powershell
New-Item arquivo.txt -ItemType File
```

> Crea un arquivo de texto baleiro no directorio actual.

---

**6. Escribir contido nun arquivo (sobreescribe).**

```powershell
Set-Content arquivo.txt "Ola"
```

> `Set-Content` sobreescribe o arquivo completo co novo contido.

---

**7. Engadir contido a un arquivo existente (sen sobreescribir).**

```powershell
Add-Content arquivo.txt "Nova liña"
```

> `Add-Content` engade o texto ao final do arquivo, conservando o contido anterior.

---

**8. Ler o contido dun arquivo.**

```powershell
Get-Content arquivo.txt
```

> Equivalente ao alias `cat`. Mostra o contido do arquivo liña a liña.

---

**9. Copiar un arquivo.**

```powershell
Copy-Item arquivo.txt copia.txt
```

> Crea unha copia do arquivo co novo nome indicado.

---

**10. Mover un arquivo a outro directorio.**

```powershell
Move-Item copia.txt C:\temp\
```

> Traslada o arquivo ao destino indicado. Equivalente a cortar e pegar.

---

**11. Renomear un arquivo.**

```powershell
Rename-Item arquivo.txt novo.txt
```

> Cambia o nome do arquivo no mesmo directorio.

---

**12. Eliminar un arquivo.**

```powershell
Remove-Item novo.txt
```

> Elimina o arquivo do sistema. A acción non é recuperable dende a Papeleira de reciclaxe.

---

## Parte 5 — Xestión de discos con DiskPart

> DiskPart é unha ferramenta de liña de comandos avanzada para xestionar discos e particións. Require abrir PowerShell como Administrador.

**1. Abrir DiskPart.**

```powershell
diskpart
```

> Inicia o intérprete de DiskPart. A partir deste momento os comandos son propios de DiskPart, non de PowerShell.

---

**2. Mostrar os discos dispoñibles.**

```powershell
list disk
```

> Lista todos os discos físicos do equipo co seu número, estado, tamaño e espazo libre.

---

**3. Seleccionar un disco para traballar con el.**

```powershell
select disk 1
```

> A partir deste momento, todas as operacións aplícanse ao disco seleccionado.

---

**4. Mostrar as particións do disco seleccionado.**

```powershell
list partition
```

> Lista as particións existentes no disco actualmente seleccionado.

---

**5. Crear unha partición primaria.**

```powershell
create partition primary
```

> Crea unha partición primaria usando todo o espazo non asignado do disco.

---

**6. Formatar a partición en NTFS.**

```powershell
format fs=ntfs quick
```

> `fs=ntfs` indica o sistema de ficheiros. `quick` realiza un formateo rápido (non sobreescribe todos os sectores).

---

**7. Asignar unha letra de unidade á partición.**

```powershell
assign letter=F
```

> A partición será accesible dende o Explorador de ficheiros como unidade `F:`.

---

**8. Ver os volumes do sistema.**

```powershell
list volume
```

> Mostra todos os volumes con letra asignada, sistema de ficheiros, tamaño e estado.

---

**9. Eliminar unha partición.**

```powershell
delete partition
```

> Elimina a partición seleccionada. Os datos non son recuperables.

---

**10. Limpar por completo un disco.**

> ⚠️ Esta operación elimina TODO o contido do disco seleccionado.

```powershell
clean
```

> Borra a táboa de particións e o MBR/GPT. O disco queda sen asignar e sen datos.

---

**11. Saír de DiskPart.**

```powershell
exit
```

> Pecha o intérprete de DiskPart e volta á consola de PowerShell.

---

## Parte 6 — Diferenza entre comandos, cmdlets e alias

**1. Consultar o tipo dun comando.**

```powershell
Get-Command dir
Get-Command Get-Process
```

> `Get-Command` indica se o comando é un `Alias`, `Cmdlet`, `Function`, `Application` ou `Script`.

---

**2. Ver todos os alias definidos no sistema.**

```powershell
Get-Alias
```

> Lista todos os alias activos na sesión actual de PowerShell.

---

**3. Ver o cmdlet real ao que apunta un alias concreto.**

```powershell
Get-Alias dir
```

> Mostra que `dir` é un alias de `Get-ChildItem`.

---

**Táboa de referencia rápida**

| Tipo | Definición | Exemplo |
|---|---|---|
| Comando | Calquera instrución executable | `Get-Process` |
| Cmdlet | Comando nativo de PowerShell (formato `Verbo-Substantivo`) | `Get-Service` |
| Alias | Nome curto que apunta a outro comando | `dir` → `Get-ChildItem` |

---

**Táboa de alias máis comúns**

| Alias | Cmdlet real |
|---|---|
| `dir` | `Get-ChildItem` |
| `cls` | `Clear-Host` |
| `cat` | `Get-Content` |
| `cd` | `Set-Location` |

---

## Parte 7 — Exemplo de script PowerShell

**1. Script básico de exemplo: limpar pantalla, pedir nome e crear carpeta.**

```powershell
Clear-Host

$nome = Read-Host "Introduce o teu nome"

Write-Host "Ola $nome"

New-Item -Path ".\carpeta_proba" -ItemType Directory

Write-Host "Carpeta creada correctamente"
```

> O script combina limpeza de pantalla, entrada de datos, saída de texto e creación de directorios nun fluxo secuencial básico.
