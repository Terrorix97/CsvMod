@ECHO OFF
color 0C
::Set the working directory
set "workingdir=%~dp0"
::Switch to working directory

set prgf=%ProgramFiles%

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set prgf=%ProgramFiles(x86)%
if "%PROCESSOR_ARCHITEW6432%"=="AMD64" set prgf=%ProgramFiles(x86)%
if "%PROCESSOR_ARCHITECTURE%"=="IA64" set prgf=%ProgramFiles(x86)%
if "%PROCESSOR_ARCHITEW6432%"=="IA64" set prgf=%ProgramFiles(x86)%

title CsvInstaller By Terrorix97
echo Create By Terrorix97
echo https://github.com/Terrorix97/CsvMod/
echo https://mybot.run/forums/thread-9996-post-84057.html#pid84057
echo .
chdir
echo .
CHOICE /C CD /M "What is your primary disk?"
IF ERRORLEVEL 2 goto dino
IF ERRORLEVEL 1 goto ciao

:ciao
echo off
set drive=drive C:
del /Q C:\ProgramData\BlueStacks\UserData\SharedFolder\*.*
mkdir C:\ProgramData\BlueStarks\UserData\SharedFolder
rem copy "%~dp0\conf\logic\*.*" C:\ProgramData\BlueStacks\UserData\SharedFolder\
copy "%~dp0\conf\csv\*.*" C:\ProgramData\BlueStacks\UserData\SharedFolder\
copy "%~dp0\conf\sc\*.*" C:\ProgramData\BlueStacks\UserData\SharedFolder\
cls
CHOICE /C YN /M "You want to use the low graphics?"
IF ERRORLEVEL 2 goto off
IF ERRORLEVEL 1 goto on
:off
ren C:\ProgramData\BlueStacks\UserData\SharedFolder\client_globals.lowgfx_off.csv client_globals.csv
:on
ren C:\ProgramData\BlueStacks\UserData\SharedFolder\client_globals.lowgfx_on.csv client_globals.csv
goto finish

:dino
echo off
set drive=drive D:
del /Q D:\ProgramData\BlueStacks\UserData\SharedFolder\*.*
mkdir D:\ProgramData\BlueStarks\UserData\SharedFolder
rem copy "%~dp0\conf\logic\*.*" D:\ProgramData\BlueStacks\UserData\SharedFolder\
copy "%~dp0\conf\csv\*.*" D:\ProgramData\BlueStacks\UserData\SharedFolder\
copy "%~dp0\conf\sc\*.*" D:\ProgramData\BlueStacks\UserData\SharedFolder\
CHOICE /C YN /M "You want to use the low graphics?"
IF ERRORLEVEL 2 goto off
IF ERRORLEVEL 1 goto on
:off
ren D:\ProgramData\BlueStacks\UserData\SharedFolder\client_globals.lowgfx_off.csv client_globals.csv
:on
ren D:\ProgramData\BlueStacks\UserData\SharedFolder\client_globals.lowgfx_on.csv client_globals.csv
cls
goto finish

:finish
cd "%prgf%"\BlueStacks"
start HD-StartLauncher.exe
echo Please wait until it is fully loaded BlueStark...
pause
taskkill /f /im Hd-Adb.exe

"%prgf%"\BlueStacks\hd-adb shell su -c "mkdir /data/data/com.supercell.clashofclans/update/"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/"
"%prgf%"\BlueStacks\hd-adb shell su -c "mkdir /data/data/com.supercell.clashofclans/update/csv"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/csv"
"%prgf%"\BlueStacks\hd-adb shell su -c "mkdir /data/data/com.supercell.clashofclans/update/logic"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/logic"
"%prgf%"\BlueStacks\hd-adb shell su -c "mkdir /data/data/com.supercell.clashofclans/update/sc"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/sc"
cls

choice /c yn /m "Copy file into COC?"
rem "%prgf%"\BlueStacks\hd-adb shell su -c "cp /storage/sdcard/windows/BstSharedFolder/buildings.csv /data/data/com.supercell.clashofclans/update/logic"
rem "%prgf%"\BlueStacks\hd-adb shell su -c "cp /storage/sdcard/windows/BstSharedFolder/traps.csv /data/data/com.supercell.clashofclans/update/logic"
"%prgf%"\BlueStacks\hd-adb shell su -c "cp /storage/sdcard/windows/BstSharedFolder/client_globals.csv /data/data/com.supercell.clashofclans/update/csv"
"%prgf%"\BlueStacks\hd-adb shell su -c "cp /storage/sdcard/windows/BstSharedFolder/texts.csv /data/data/com.supercell.clashofclans/update/csv"
cls

"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/csv/texts.csv"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/csv/client_globals.csv"
rem "%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/logic/traps.csv"
rem "%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/logic/buildings.csv"
cls

choice /c yn /m "DarkClouds?"
"%prgf%"\BlueStacks\hd-adb shell su -c "cp /storage/sdcard/windows/BstSharedFolder/clouds.sc /data/data/com.supercell.clashofclans/update/sc"
"%prgf%"\BlueStacks\hd-adb shell su -c "chmod -R 777 /data/data/com.supercell.clashofclans/update/sc/clouds.sc"
cls
echo.
echo Csv Mods installation completed.
echo If you got this far, everything is complete. 
echo.

Pause
exit