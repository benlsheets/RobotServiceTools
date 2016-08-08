@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS
SET me=%~n0
SET parent=%~dp0

FOR /D %%G IN ("../*") DO (
  cd /D ../%%G
  IF EXIST BACKINFO rd /S /Q BACKINFO
  IF EXIST HOME rd /S /Q HOME
  IF EXIST system.xml del system.xml

  FOR /D %%H IN ("RAPID/*") DO (
    IF EXIST RAPID\%%H\PROGMOD\T_ROB*.mod (
      move RAPID\%%H\PROGMOD\T_ROB*.mod >nul
      move RAPID\%%H\SYSMOD\Common.sys >nul
    )

    IF EXIST RAPID\%%H\PROGMOD\T_COMM*.mod (
      move RAPID\%%H\PROGMOD\T_COMM*.mod >nul
    )
  )

  IF EXIST RAPID rd /S /Q RAPID
)

GOTO END

:ERROR
PAUSE
ENDLOCAL
ECHO ON
@EXIT /B 2

:END
ENDLOCAL
ECHO ON
@EXIT /B 0
