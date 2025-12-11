@ECHO off
setlocal enabledelayedexpansion

:: Change to project root directory
cd %~dp0/..

:: Clean category flags
SET "CLEAN_GENSRC=0"
SET "CLEAN_BUILD=0"
SET "CLEAN_INSTALL=0"
SET "CLEAN_ALL=0"

:parse_args
:: Parse command line arguments
    IF "%~1"=="" GOTO :execute_clean
    IF /i "%~1"=="-gensrc" (SET "CLEAN_GENSRC=1") & shift & GOTO :parse_args
    IF /i "%~1"=="-build" (SET "CLEAN_BUILD=1") & shift & GOTO :parse_args
    IF /i "%~1"=="-install" (SET "CLEAN_INSTALL=1") & shift & GOTO :parse_args
    IF /i "%~1"=="-all" (SET "CLEAN_ALL=1") & shift & GOTO :parse_args

:: Unknown argument
ECHO Unknown argument: %~1
GOTO :usage


:: --- Clean Functions ---
:clean_build
:: Delete build directory
    IF EXIST .\build (
        ECHO Removing build directory...
        rmdir /s /q .\build
    )
    GOTO :eof

:clean_install
:: Delete install directory
    IF EXIST .\install (
        ECHO Removing install directory...
        rmdir /s /q .\install
    )
    GOTO :eof

:clean_gensrc
:: Delete CMake generated files
    ECHO Removing generated files:

    :: Generated File Path Array
    SET "GEN_FILES[0]=.\docs\Doxyfile"
    SET "GEN_FILES[1]=.\docs\prj\inaug.md"
    SET "GEN_FILES[2]=.\docs\ref\index.html"
    SET "GEN_FILES[3]=.\lib\xptemp_metadata\info.h"
    SET "GEN_FILES[4]=.\lib\xptemp_metadata\version.h"

    :: Loop through and delete files
    SET /a count=0
    :gensrc_loop
    IF DEFINED GEN_FILES[!count!] (
        IF EXIST !GEN_FILES[%count%]! (
            ECHO Removing "!GEN_FILES[%count%]!"...
            del "!GEN_FILES[%count%]!"
        ) ELSE (
            ECHO !GEN_FILES[%count%]! not found!
        )

        SET /a count+=1
        GOTO :gensrc_loop
    )
    GOTO :eof


:execute_clean
:: Main cleaning execution
    :: Check for missing argument
    IF "%CLEAN_BUILD%%CLEAN_INSTALL%%CLEAN_GENSRC%%CLEAN_ALL%"=="0000" GOTO :usage

    ECHO.
    ECHO Cleaning source tree:
    
    :: Execute based on flags
    IF "%CLEAN_ALL%"=="1" (
        call :clean_gensrc
        call :clean_build
        call :clean_install
        GOTO :complete
    )
    
    IF "%CLEAN_GENSRC%"=="1" call :clean_gensrc
    IF "%CLEAN_BUILD%"=="1" call :clean_build
    IF "%CLEAN_INSTALL%"=="1" call :clean_install


:: --- Operation Complete ---
:complete
ECHO.
ECHO Done.
ECHO.
pause
GOTO :end

:: --- Usage Instructions ---
:usage
ECHO.
ECHO Usage: %~nx0 ^<-gensrc^|-build^|-install^|-all^>
ECHO.
ECHO    [-gensrc]: Deletes all generated files in source tree
ECHO     [-build]: Deletes entire build tree
ECHO   [-install]: Deletes entire install tree
ECHO       [-all]: Deletes all specified above
ECHO.
ECHO         NOTE: You can combine multiple options.

:: --- Return To User ---
:end
endlocal
EXIT /B 0
