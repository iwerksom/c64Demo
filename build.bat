@echo off
REM ============================================================
REM  NINETEEN84 — build and launch
REM  Double-click this from Explorer to build and run.
REM  Uses "start" so VICE opens in its own window immediately.
REM ============================================================

SET OSCAR="%ProgramFiles%\oscar64\bin\oscar64.exe"
SET SRC=nineteen84.c
SET PRG=nineteen84.prg

echo Building %SRC% ...
%OSCAR% -tm=c64 -O2 %SRC%

IF ERRORLEVEL 1 (
    echo.
    echo BUILD FAILED - see errors above
    pause
    exit /b 1
)

echo Build OK: %PRG%
echo Launching VICE...

REM "start" launches VICE in its own window without blocking this script
start x64sc.exe -autostart %PRG%