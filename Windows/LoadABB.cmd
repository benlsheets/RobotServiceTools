@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS
SET me=%~n0
SET parent=%~dp0

SET commandfile=ABB_Load.txt

IF EXIST lib\%commandfile% (
  lib\ftploadloop.cmd %commandfile%
  GOTO END
) ELSE (
  ECHO %me%: "%parent%%commandfile%" FTP command file not found.
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
