rem Instal on printer-server PC !!!!
rem Fix eror 0x0000011b for Windows 10

@echo off
Title Local Printer FIX
cls
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)    
cls
echo Add reg parametr
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Print" /v "RpcAuthnLevelPrivacyEnabled" /t REG_DWORD /d "0"
echo Done
net stop "spooler"
net start "spooler"
echo FINISH!
timeout /t 5 