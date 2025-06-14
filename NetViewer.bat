@echo off
chcp 65001
title NetViewer
mode 90,28
:main
cls
echo.
echo      [0;34m███[0;37m╗   [0;34m██[0;37m╗[0;34m███████[0;37m╗[0;34m████████[0;37m╗    [0;34m██[0;37m╗   [0;34m██[0;37m╗[0;34m██[0;37m╗[0;34m███████[0;37m╗[0;34m██[0;37m╗    [0;34m██[0;37m╗[0;34m███████[0;37m╗[0;34m██████[0;37m╗ 
echo      [0;34m████[0;37m╗  [0;34m██[0;34m[0;37m║[0;34m██[0;37m╔════╝╚══[0;34m██[0;37m[0;37m╔══╝    [0;34m██[0;37m║   [0;34m██[0;37m║[0;34m██[0;37m║[0;34m██[0;37m╔════╝[0;34m██[0;37m║    [0;34m██[0;37m║[0;34m██[0;37m╔════╝[0;34m██[0;37m╔══[0;34m██[0;37m╗
echo      [0;34m██[0;37m╔[0;34m██[0;37m╗ [0;34m██[0;37m║[0;34m█████[0;37m╗     [0;34m██[0;37m║       [0;34m██[0;37m║   [0;34m██[0;37m║[0;34m██[0;37m║[0;34m█████[0;37m╗  [0;34m██[0;37m║ [0;34m█[0;37m╗ [0;34m██[0;37m║[0;34m█████[0;37m╗  [0;34m██████[0;37m╔╝
echo      [0;34m██[0;37m║╚[0;34m██[0;37m╗[0;34m██[0;37m║[0;34m██[0;37m╔══╝     [0;34m██[0;37m║       ╚[0;34m██[0;37m╗ [0;34m██[0;37m╔╝[0;34m██[0;37m║[0;34m██[0;37m╔══╝  [0;34m██[0;37m║[0;34m███[0;37m╗[0;34m██[0;37m║[0;34m██[0;37m╔══╝  [0;34m██[0;37m╔══[0;34m██[0;37m╗
echo      [0;34m██[0;37m║ ╚[0;34m████[0;37m║[0;34m███████[0;37m╗   [0;34m██[0;37m║        [0;37m╚[0;34m████[0;37m╔╝ [0;34m██[0;37m║[0;34m███████[0;37m╗╚[0;34m███[0;37m╔[0;34m███[0;37m╔╝[0;34m███████[0;37m╗[0;34m██[0;37m║  [0;34m██[0;37m║
echo      [0;37m╚═╝  ╚═══╝╚══════╝   ╚═╝         ╚═══╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝
echo.
echo.
echo    ╔═════════════╗
echo    ║NETWORK TOOLS║
echo    ╚═════════════╝
echo.
echo [1] [0;34mWIFI CAPTURED       [0;37m
echo. 
echo [2] [0;34mACTIVE CONNECTION   [0;37m
echo. 
echo [3] [0;34mDNS CACHE CLEANER   [0;37m
echo. 
echo [4] [0;34mEXIT                [0;37m
echo.



set /p input=═══3  

if "%input%"=="1" goto capture else

if "%input%"=="2" goto active else

if "%input%"=="3" goto dns else

if "%input%"=="4" goto exit else



echo [0;34m[!] Invalid input. [0;37mPlease try again... [!]
timeout 2 >nul
goto main



:capture
title Connection Capture
color 0A

:: Imposta il file di log
set LOGFILE=Wifi_Capture.txt

:: Pulizia iniziale del log
echo Monitoraggio Connessioni - %date% %time% > %LOGFILE%
echo -------------------------------------------- >> %LOGFILE%

:script
cls
echo Monitoraggio Connessioni di Rete
echo.

:: Mostra connessioni attive e salva nel log
echo %time% - Active Connection: >> %LOGFILE%
netstat -ano | findstr "ESTABLISHED" >> %LOGFILE%
echo. >> %LOGFILE%

:: Mostra connessioni attive in tempo reale
netstat -ano | findstr "ESTABLISHED"

echo --------------------------------------
echo Update in 5 seconds...
timeout 5 > nul
goto script


:Active
title Active Connection
cls
echo [0;37m
echo                       ┌───────┐   ╔════════════════════╗
echo                       │ ════ o│   ║                    ║
echo                       ├───────┤   ║                    ║
echo    ╔══════════════╗   │[■■■■]o│   ║                    ║
echo    ║              ║   ├───────┤   ║                    ║
echo    ║              ║   │       │   ╚════════╤══╤══════o═╝
echo    ║              ║   │       │─────┘  ____│__│____
echo    ║              ║   │       │─┐     /____________\
echo    ╚══════════════╝   └───────┘ │ ________________
echo   /::::::::::::::::\      │     └/::::::::::::::::\
echo  /:::::════════:::::\    /T\    /:::::════════:::::\
echo  ════════════════════    \_/    ════════════════════ 
echo ----------------------------------------------------------------
echo [0;32m
netstat

pause >nul
goto main




:dns
ipconfig /flushdns
timeout 2 >nul
goto main






                                                                           