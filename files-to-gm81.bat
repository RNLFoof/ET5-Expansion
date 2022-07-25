@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure you want to recreate the gm81 version? All changes not in the files will be lost! (Y/[N])
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

call echo ok sick. deleting...
DEL et5.gm81
gmksplit et5 et5.gm81

:END
endlocal

cmd /k