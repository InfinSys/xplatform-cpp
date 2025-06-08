@echo off

setlocal

where doxygen >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Doxygen is not installed on the machine, cannot generate documentation.
    echo.
    pause
    exit /b 1
)

cd ../ && doxygen ./Doxyfile
cd ref/doxygen/html/ && index.html

where miktex >nul 2>&1
if %errorlevel% neq 0 (
    echo NOTICE: MiKTeX is not installed on the machine, cannot generate PDF documentation.
    echo.
    pause
) else (
    cd ref/doxygen/latex && call make.bat
    refman.pdf
)

endlocal

echo.
echo Docs generation script complete
