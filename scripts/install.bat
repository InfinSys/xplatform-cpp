@ECHO off
setlocal

:: Check for missing CMake preset name argument
IF "%~1"=="" GOTO :usage

SET "CMAKE_PRESET=%~1"
SET "COMPONENT=%~2"

:: Change to project root directory
cd %~dp0/..

:: Get the current directory for install prefix
SET "PROJECT_ROOT=%CD%"

:: Installation path prefix
SET "INSTALL_PATH_PREFIX=%PROJECT_ROOT%\install\%CMAKE_PRESET%"
:: TODO: Configure build installation path prefix

:: Check if COMPONENT is empty
IF "%COMPONENT%"=="" (
    :: Install without component specification
    cmake --install ".\build\%CMAKE_PRESET%" --prefix "%INSTALL_PATH_PREFIX%"
) ELSE (
    :: Install with component specification
    cmake --install ".\build\%CMAKE_PRESET%" --component "%COMPONENT%" --prefix "%INSTALL_PATH_PREFIX%"
)

echo Done.
echo.
pause

GOTO :end

:: --- Usage Instructions ---
:usage
ECHO.
ECHO Usage: %~nx0 ^<cmake_preset^> [component]
ECHO.
ECHO Examples:
ECHO   %~nx0 win32-x64-msvc-debug DemoApp     (installs 'DemoApp' component)
ECHO                       OR
ECHO   %~nx0 win32-x64-mingw-debug            (installs all components)

:: --- Return To User ---
:end
endlocal
EXIT /B 0
