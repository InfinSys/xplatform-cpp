@ECHO off
setlocal

:: Check for missing CMake preset name argument
IF "%~1"=="" (
    ECHO.
	ECHO Error: No CMake preset provided.
	GOTO :usage
)

SET "CMAKE_PRESET=%~1"

:: Change to project root directory
cd %~dp0/..

cmake --build --preset "%CMAKE_PRESET%"

ECHO Done.
ECHO.
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
