@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS
SET me=%~n0
SET parent=%~dp0

SET addressfile=Addresses_Save.txt
SET backuproot=C:\Users\Public\Downloads

IF EXIST %addressfile% (
  FOR /F "tokens=1,2 delims==" %%I IN (%addressfile%) DO (
    IF %%I == root (
      SET backuproot="%%J"
    ) ELSE (
      ECHO %me%: Saving %%I to %backuproot%\%%J...
      cd /d "%backuproot%" || (
        ECHO %me%: "%backuproot%" backup root directory not found.
        GOTO ERROR
      )
      mkdir "%%J" || (
        ECHO %me%: "%%J" backup directory creation failed.
        GOTO ERROR
      )
      cd /d "%%J"
      ftp -s:"%parent%%1" %%I > NUL
      cd /d "%backuproot%"
      ECHO %me%: Done
    )
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
