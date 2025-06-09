@echo off

cd %~dp0/..
cmake --build --preset win32-x64-Debug --target code_format

echo Done.
echo.
pause
