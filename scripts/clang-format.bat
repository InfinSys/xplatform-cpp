@ECHO off
setlocal

:: Check for missing CMake preset name argument
IF "%~1"=="" GOTO :usage

SET "CMAKE_PRESET=%~1"

:: Change to project root directory
cd %~dp0/..

cmake --build --preset "%CMAKE_PRESET%" --target XPTEMP_clang_format
:: TODO: Change 'XPTEMP_clang_format' to my Clang-Format utility target name

echo Done.
echo.
pause

GOTO :end

:: --- Usage Instructions ---
:usage
ECHO.
ECHO Usage: %~nx0 ^<cmake_preset^>
ECHO.
ECHO Examples:
ECHO   %~nx0 win32-x64-msvc-debug
ECHO   %~nx0 win32-x64-mingw-release

:: --- Return To User ---
:end
endlocal
EXIT /B 0
