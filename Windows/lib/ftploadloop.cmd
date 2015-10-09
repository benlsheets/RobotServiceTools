@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS
SET me=%~n0
SET parent=%~dp0

SET addressfile=Addresses_Load.txt

IF EXIST %addressfile% (
  FOR /F "tokens=1,2 delims==" %%I IN (%addressfile%) DO (
    ECHO %me%: Loading %%I to %%J...
    cd /d "%%I" || (
      ECHO %me%: "%%I" FTP load directory not found.
      GOTO ERROR
    )
    ftp -s:"%parent%%1" %%J > NUL
    cd /d "%parent%"
    ECHO %me%: Done
  )
  GOTO END
) ELSE (
  ECHO %me%: "%parent%%addressfile%" FTP address file not found.
  GOTO ERROR
)

:ERROR
PAUSE
ENDLOCAL
ECHO ON
@EXIT /B 2

:END
ENDLOCAL
ECHO ON
@EXIT /B 0
