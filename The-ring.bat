@echo off
:: The-ring
:: creado por vertigo85
:: sitio web: www.honeypot.es
SETLOCAL 
:principal
echo Bienvenido a configurator
echo Menu principal
echo 1: informacion del sistema
echo 2: configurar la red del equipo
echo 3: instalar automaticamente utilidades
echo 4: instalar aikoncwd
echo 5: creacion masiva de usuarios
echo 6: liberar espacio
echo 7: hacer copias de seguridad
echo 8: apagar equipo
echo 9:	salir
choice /m "seleccione una opcion" /c:123456789 
if errorlevel 9 goto salir 
if errorlevel 8 goto apagar
if errorlevel 7 goto seguridad
if errorlevel 6 goto liberar 
if errorlevel 5 goto usuarios
if errorlevel 4 goto cwd
if errorlevel 3 goto instalacion
if errorlevel 2 goto red
if errorlevel 1 goto informacion 
:informacion
start msinfo32 
goto principal
:red
echo menu red
echo 1: informacion de la red
echo 2: configurar tarjeta de red wifi
echo 3: configurar tarjeta de red
echo 4: comprobar red
echo 5: atras
choice /m "seleccione una opcion" /c:12345
if errorlevel 5 goto principal
if errorlevel 4 goto comprobacion
if errorlevel 3 goto configuracion
if errorlevel 2 goto wifi
if errorlevel 1 goto inforred
:infored
ipconfig
goto red
:wifi
netsh wlan show networks

set /p name= introduce el nombre de la red
set /p ssid= introduce el ssid
set /p interface= introduce el interfaz
netsh wlan connect name=%name% ssid=%ssid% interface=%interface%
set /p ip= ¿escribe tu ip a continuacion?
set /p password= ¿escribe tu contraseña a continuacion?
set /p enlace= ¿escribe tu puerta de enlace a continuacion?
netsh 
::salud wifi
Netsh WLAN show WLANreport
:configuracion
netsh
:intalacion
echo si no tienes chocolatey instalado el script no funcionara, se recomienda asi que pulses la opcion 1
echo menu instalacion
echo 0: instalar/desinstalar chocolatey
echo 1: instalar aplicaciones gamer
echo 2: instalar aplicaciones ofimaticas
echo 3: instalar aplicaciones de diseño grafico
echo 4: instalar reproductor musica
echo 5: instalar reproductor video
echo 6: instalar aplicaciones de desarrollo
echo 7: instalar herramientas de mantenimiento
echo 8: instalar aplicacion especificando un nombre
echo 9: atras
choice /m "seleccione una opcion" /c:1234567890  

if errorlevel 9 goto principal
if errorlevel 8 goto especifico
if errorlevel 7 goto mantenimiento
if errorlevel 6 goto desarrollo
if errorlevel 5 goto video 
if errorlevel 4 goto musica 
if errorlevel 3 goto diseno
if errorlevel 2 goto ofimatica
if errorlevel 1 goto gamer
if errorlevel 0 goto chocolatey
:chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
goto instalacion
:gamer
choco install steam goggalaxy battle.net origin -y
goto instalacion
:ofimatica
choco install libreoffice -y
goto instalacion
:diseno
choco install gimp inkscape -y
goto instalacion
:musica
choco install foobar
goto instalacion
:video
choco install mpc-be
choco install vlc
goto instalacion
:desarrollo
choco install brackets
choco install Bitnami-XAMPP
choco install notepadplusplus
choco install
goto instalacion
:mantenimiento
choco install ccleaner
choco install
goto instalacion
:especifico
set /p programa= indica los nombres de los programas a instalar
choco install %programa%
:cwd
powershell "Invoke-WebRequest https://github.com/aikoncwd/win10script/raw/master/releases/aikoncwd-win10-script-v5.3.zip -OutFile .\master.zip"
powershell "Expand-Archive -Path master.zip -DestinationPath %CD%"
del master.zip
start aikoncwd-win10-script.vbs
del aikoncwd-win10-script.vbs
go to principal
:usuarios
setlocal EnableDelayedExpansion
:liberar
dism /online /cleanup-image /spsuperseded

:seguridad
set /p copia= ¿en que unidad deseas guardar tu copia de seguridad?
if %copia% 
wbadmin start systemstatebackup -backupTarget:%copia%: -quiet
goto principal
:apagar
echo menu 
echo 1: apagar
echo 2: reiniciar
echo 3: atras
choice /m "seleccione una opcion" /c:123
if errorlevel 3 goto principal 
if errorlevel 2 goto reiniciar
if errorlevel 1 goto apaga
:apaga
shutdown -s
:reiniciar
shutdown -r
:salir
endlocal