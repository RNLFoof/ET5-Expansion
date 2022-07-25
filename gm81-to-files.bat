@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure you want to recreate the files version? All changes not in the gm81 will be lost! (Y/[N])
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

call echo ok sick. deleting...
@RD /S /Q et5
gmksplit et5.gm81 et5

:END
endlocal

cmd /k