@ECHO OFF 
title Selecciona un opcion 

:inicio 
CLS 
color 06
ECHO ******************** 
ECHO *****-=[MENU]=-***** 
ECHO ******************** 
ECHO 1) ip y mascara estatico 
ECHO 2) Puertos abiertos 
ECHO 3) ip dinamica
ECHO 4) ip com gateway
ECHO 5) probar internet
ECHO 6) hacer PING
ECHO 7) mostrar puertos
ECHO 8) cerrar puerto
ECHO 9) abrir puerto
ECHO 10) Maquinas en RED
ECHO ******************** 
ECHO S^|s) Salir 
ECHO ******************** 
ECHO. 

SET /p var=Seleccione una opcion :
CLS
if "%var%"=="1" goto op1 
if "%var%"=="2" goto op2 
if "%var%"=="3" goto op3 
if "%var%"=="4" goto op4 
if "%var%"=="5" goto op5
if "%var%"=="6" goto op6 
if "%var%"=="7" goto op7
if "%var%"=="8" goto op8
if "%var%"=="9" goto op9
if "%var%"=="10" goto op10

if "%var%"=="S" goto salir 
if "%var%"=="s" goto salir
::Mensaje de error, validación cuando se selecciona una opción fuera de rango 
ECHO. El numero "%var%" no es una opcion valida, por favor intente de nuevo. 
ECHO. 
pause 
ECHO. 
goto inicio 

:op1 
ECHO. 
ECHO. Has elegido ip y mascara estatico   
ECHO. 
SET /p ip="Ingrese ip: " 
SET /p mask="Ingrese mascara: "
SET /p net="Ingrese nombre de la RED: "
netsh interface ipv4 SET address name="%net%" static %ip% %mask%
ECHO. nombre = "%net%" static %ip% %mask%
REM ipconfig | find 
color 09
ECHO. 
pause 
goto inicio 

:op2 
ECHO. 
ECHO. Has elegido la opcion No. 2 
ECHO. 
mode con cols=70 
:start
CLS
ECHO Puertos abiertos 
ECHO.
NETSTAT -AN|FINDSTR /C:LISTENING
ping -n 8 127.0.0.1>nul
color 09 
ECHO. 
pause 
goto inicio 

:op3 
ECHO. 
ECHO. Has elegido la opcion No. 3 
ECHO. 
SET /p net=" Ingrese nombre de la RED: "
netsh interface ipv4 SET address name="%net%" dhcp 
ECHO. se canbio la ip a ip dinamica
color 09 
ECHO. 
pause 
goto inicio 

:op4 
ECHO. 
ECHO. Has elegido la opcion No. 4 
ECHO. 
SET /p ip="Ingrese ip: " 
SET /p mask="Ingrese mascara: "
SET /p gate=" Ingrese gateway: "
SET /p net=" Ingrese nombre de la RED: "
netsh interface ipv4 SET address name="%net%" static %ip% %mask% %gate%
REM ipconfig | find 
color 09 
ECHO. 
pause 
goto inicio 

:op5 
ECHO. 
ECHO. Has elegido la opcion No. 5 
ECHO. 
::Aquí van las líneas de comando de tu opción 
ping 8.8.8.8 -t
color 09 
ECHO. 
pause 
goto inicio 

:op6
ECHO. 
ECHO. Has elegido la opcion No. 6
ECHO. 
::Aquí van las líneas de comando de tu opción 
SET /p net=" Ingrese IP: "
ping "%net%"
color 09 
ECHO. 
pause 
goto inicio

:op7
ECHO. 
ECHO. Has elegido la opcion No. 7
ECHO. 
::Aquí van las líneas de comando de tu opción 
netstat -ano
color 09 
ECHO. 
pause 
goto inicio

:op8
ECHO.
ECHO. Has elegido la opcion No. 8
ECHO.
::Aquí van las líneas de comando de tu opción
ECHO.
netstat -ano
ECHO.
ECHO * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
SET /p net=" Ingrese Puerto para cerrar: "
netstat -ano | findstr :"%net%"
ECHO.
SET /p net=" Ingrese PID: "
taskkill /PID "%net%" /F
color 09 
ECHO. 
pause 
goto inicio

:op9
ECHO. 
ECHO. Has elegido la opcion No. 9
ECHO. 
ECHO. faltaaaaa
::Aquí van las líneas de comando de tu opción
netsh wlan show interfaces
color 09 
ECHO. 
pause 
goto inicio



:op10
ECHO. 
ECHO. Has elegido la opcion No. 10
ECHO. 
::Aquí van las líneas de comando de tu opción
net view
color 09 
ECHO. 
pause 
goto inicio

:salir 
@CLS&exit 
