@echo off
chcp 437
cls
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)    
cls
echo Stopping time service
net stop w32time
rem echo Setting time server
rem w32time /config /manualpeerlist:"time.windows.com" /syncfromflags:manual /reliable:yes /update
echo Starting time service
net start w32time
echo Time synchronization...
w32tm /resync /force
echo Time sync completed
pause /t 5