@echo off & cls
title Dennis_copiar_Usb

call :existe

:existe
if exist "G:\" ( call :nombre G: )
if exist "H:\" ( call :nombre H: )
if exist "F:\" ( call :nombre F: )
if exist "I:\" ( call :nombre I: )
if exist "J:\" ( call :nombre J: )
if exist "K:\" ( call :nombre K: )

:nombre
set var= "vol %1 | findstr unidad"
for /f "usebackq tokens=8,* delims= " %%f in (`%var%`) do (
    call :copiar %1 %%f
)

:copiar
:: Aqui va la carpeta donde se va copiar el USB
set CARPETA= %date:~0,2%%date:~3,2%%date:~6,4%_%time:~0,2%%time:~3,2%%time:~6,2%_%2
MD %CARPETA%
xcopy %1\* %CARPETA% /S>nul
rem /S= copia los directorio y sub directorios excepto los vacios
exit