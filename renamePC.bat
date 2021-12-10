@Echo Off

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)    

cls
wmic computersystem where name="%computername%" call rename name="%UserName%-PC"
shutdown /r /t 5
rem del renamePC.bat