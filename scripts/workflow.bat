@ECHO off
setlocal

:: This script enables or disables a GitHub Actions workflow.
:: It moves the workflow .yml file between the .github/workflows/
:: directory and the .github/ root directory to achieve this.

SET "GITHUB_DIR=.github"
SET "WORKFLOWS_SUBDIR=workflows"
SET "WORKFLOWS_PATH=%GITHUB_DIR%\%WORKFLOWS_SUBDIR%"

IF "%~1"=="" GOTO :usage
IF "%~2"=="" GOTO :usage

SET "ACTION=%~1"
SET "WORKFLOW_FILE=%~2"

SET "ENABLED_FILE_PATH=%WORKFLOWS_PATH%\%WORKFLOW_FILE%.yml"
SET "DISABLED_FILE_PATH=%GITHUB_DIR%\%WORKFLOW_FILE%.yml"

cd %~dp0/..

IF NOT EXIST "%ENABLED_FILE_PATH%" (
    IF NOT EXIST "%DISABLED_FILE_PATH%" (
        ECHO.
        ECHO Error: No such GitHub Workflows specification "%WORKFLOW_FILE%.yml" exist!
        GOTO :eof
    )
)

IF /I "%ACTION%"=="false" (
    IF EXIST "%DISABLED_FILE_PATH%" (
        ECHO.
        ECHO The "%WORKFLOW_FILE%" Workflow is ALREADY disabled!
        ECHO Found in: "%GITHUB_DIR%"
        ECHO No action needed.
    ) ELSE (
        ECHO.
        ECHO Attempting to disable "%WORKFLOW_FILE%" GitHub Workflow:

        :: Move the Workflow file to disable it
        ECHO Moving "%ENABLED_FILE_PATH%" to "%DISABLED_FILE_PATH%"...
        
        MOVE "%ENABLED_FILE_PATH%" "%DISABLED_FILE_PATH%" >NUL
        IF %ERRORLEVEL% NEQ 0 (
            ECHO.
            ECHO Error: FAILED to move "%WORKFLOW_FILE%". Check permissions or if the file is in use.
        ) ELSE (
            ECHO.
            ECHO Disabled "%WORKFLOW_FILE%" GitHub Workflow successfully.
        )
    )
) ELSE (
    IF /I "%ACTION%"=="true" (
        IF EXIST "%ENABLED_FILE_PATH%" (
            ECHO.
            ECHO The "%WORKFLOW_FILE%" Workflow is ALREADY enabled!
            ECHO Found in "%WORKFLOWS_PATH%"
            ECHO No action needed.
        ) ELSE (
            ECHO.
            ECHO Attempting to enable "%WORKFLOW_FILE%" GitHub Workflow:

            :: Create 'workflows' directory if it doesn't exist
            IF NOT EXIST "%WORKFLOWS_PATH%" (
                ECHO Creating GitHub Workflow directory...
                MKDIR "%WORKFLOWS_PATH%"
                IF %ERRORLEVEL% NEQ 0 (
                    ECHO.
                    ECHO Error: FAILED to create directory "%WORKFLOWS_PATH%". Check permissions.
                    GOTO :eof
                )
            )

            :: Move the Workflow file to enable it
            ECHO Moving "%DISABLED_FILE_PATH%" to "%ENABLED_FILE_PATH%"...

            MOVE "%DISABLED_FILE_PATH%" "%ENABLED_FILE_PATH%" >NUL
            IF %ERRORLEVEL% NEQ 0 (
                ECHO.
                ECHO Error: FAILED to move "%WORKFLOW_FILE%". Check permissions or if the file is in use.
            ) ELSE (
                ECHO.
                ECHO Enabled "%WORKFLOW_FILE%" GitHub Workflow successfully.
            )
        )
    ) ELSE (
        ECHO.
        ECHO Error: Invalid state argument "%ACTION%".
        GOTO :usage
    )
)

GOTO :end


:: --- Usage Instructions ---
:usage
ECHO.
ECHO Usage: %~nx0 [true^|false] [workflow_filename]
ECHO.
ECHO    [true]: Enables the specified GitHub Workflow by moving it from .github/ to .github/workflows/
ECHO   [false]: Disables the specified GitHub Workflow by moving it from .github/workflows/ to .github/
ECHO.
ECHO Examples:
ECHO   %~nx0 false my_ci_workflow
ECHO   %~nx0 true my_deploy_workflow

:: --- Return To User ---
:end
endlocal
EXIT /B 0
