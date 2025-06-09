@echo off

set "cmake_preset=%1"

if "%cmake_preset%"=="" (
    echo Error: No CMake preset provided.
    echo Usage: %~nx0 ^<cmake_preset^>
    exit /b 1
)

cd %~dp0/..
cmake --preset %cmake_preset%

echo.
pause
