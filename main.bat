@ECHO OFF
 TITLE stop services
ECHO ---------------------------------------------------
ECHO Simple batch script to stop services on Windows
ECHO Services can be changed with a notepad
ECHO ---------------------------------------------------
ECHO SCRIPT MUST BE RUN AS ADMINISTRATOR
ECHO ---------------------------------------------------

:start
SET choice=
SET /p choice=Do you really want to continue? y/n: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
ECHO "%choice%" is not valid. Type "y" or "n"
ECHO.
GOTO start

:no
ECHO Canceled
PAUSE
EXIT

:yes
net stop TimeBrokerSvc
net stop SEMgrSvc
net stop XblAuthManager
net stop DoSvc
net stop TrkWks
ECHO Completed
PAUSE
EXIT
