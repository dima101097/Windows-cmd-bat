@echo off 
title Reset AnyDesk
chcp 437
cls
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)    
cls
taskkill /f /im "AnyDesk.exe"
del /f "%ALLUSERSPROFILE%\AnyDesk\service.conf"
del /f "%APPDATA%\AnyDesk\service.conf"
del /f /a /q "%ALLUSERSPROFILE%\AnyDesk\*"
del /f /a /q "%APPDATA%\AnyDesk\*"
set AnyDesk1=%SystemDrive%\Program Files (x86)\AnyDesk\AnyDesk.exe
set AnyDesk2=%SystemDrive%\Program Files\AnyDesk\AnyDesk.exe
if exist "%AnyDesk1%" start "" "%AnyDesk1% "
if exist "%AnyDesk2%" start "" "%AnyDesk2%"
