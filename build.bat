@echo off
REM ============================================================
REM  NINETEEN84 - C64 Demo Build Script
REM  Requires oscar64 installed (Windows installer)
REM ============================================================

SET OSCAR="%ProgramFiles(x86)%\oscar64\bin\oscar64.exe"

IF NOT EXIST %OSCAR% (
    echo ERROR: oscar64 not found at %OSCAR%
    echo Please install from: https://github.com/drmortalwombat/oscar64/releases
    pause
    exit /b 1
)

echo Building nineteen84.c ...

REM --- Build only (produces nineteen84.prg) ---
%OSCAR% -tm=c64 -O2 -o nineteen84.prg nineteen84.c

IF ERRORLEVEL 1 (
    echo.
    echo BUILD FAILED - see errors above
    pause
    exit /b 1
)

echo.
echo Build successful: nineteen84.prg
echo.
echo To run in the built-in emulator:
echo   oscar64 -tm=c64 -O2 -e nineteen84.c
echo.
echo To run in VICE:
echo   x64sc.exe nineteen84.prg
echo.
pause
