@ECHO off
setlocal

:: This script enables or disables a GitHub Actions Workflow.
:: It moves the Workflow .yml file between the .github/workflows/
:: directory and the .github/disabled_workflows/ directory to
:: achieve this.

SET "GITHUB_DIR=.github"
SET "WORKFLOWS_SUBDIR=workflows"
SET "WORKFLOWS_PATH=%GITHUB_DIR%\%WORKFLOWS_SUBDIR%"
SET "DISABLED_WORKFLOWS_PATH=%GITHUB_DIR%\disabled_workflows"

IF "%~1"=="" GOTO :usage
IF "%~2"=="" GOTO :usage

SET "ACTION=%~1"
SET "WORKFLOW_FILE=%~2"

SET "ENABLED_FILE_PATH=%WORKFLOWS_PATH%\%WORKFLOW_FILE%.yml"
SET "DISABLED_FILE_PATH=%DISABLED_WORKFLOWS_PATH%\%WORKFLOW_FILE%.yml"

cd %~dp0/..

IF NOT EXIST "%ENABLED_FILE_PATH%" (
    IF NOT EXIST "%DISABLED_FILE_PATH%" (
        ECHO.
        ECHO Error: No such GitHub Workflows specification "%WORKFLOW_FILE%.yml" exist!
        GOTO :eof
    )
)

IF /I "%ACTION%"=="disable" (
    IF EXIST "%DISABLED_FILE_PATH%" (
        ECHO.
        ECHO The "%WORKFLOW_FILE%" Workflow is ALREADY disabled!
        ECHO Found in: "%DISABLED_WORKFLOWS_PATH%"
        ECHO No action needed.
    ) ELSE (
        ECHO.
        ECHO Attempting to disable "%WORKFLOW_FILE%" GitHub Workflow:

        ECHO Moving "%WORKFLOW_FILE%.yml" to "%DISABLED_FILE_PATH%"...

        :: Create 'disabled_workflows' directory if it doesn't exist
        IF NOT EXIST "%DISABLED_WORKFLOWS_PATH%" (
            ECHO Creating disabled GitHub Workflow directory...
            MKDIR "%DISABLED_WORKFLOWS_PATH%"
            IF %ERRORLEVEL% NEQ 0 (
                ECHO.
                ECHO Error: FAILED to create directory "%DISABLED_WORKFLOWS_PATH%". Check permissions.
                GOTO :eof
            )
        )
        
        :: Move the Workflow file to disable it
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
    IF /I "%ACTION%"=="enable" (
        IF EXIST "%ENABLED_FILE_PATH%" (
            ECHO.
            ECHO The "%WORKFLOW_FILE%" Workflow is ALREADY enabled!
            ECHO Found in: "%WORKFLOWS_PATH%"
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

            ECHO Moving "%WORKFLOW_FILE%.yml" to "%ENABLED_FILE_PATH%"...

            :: Move the Workflow file to enable it
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
ECHO Usage: %~nx0 [enable^|disable] [workflow_filename]
ECHO.
ECHO    [enable]: Enables the specified GitHub Workflow by moving it from .github/disabled_workflows/ to .github/workflows/
ECHO   [disable]: Disables the specified GitHub Workflow by moving it from .github/workflows/ to .github/disabled_workflows/
ECHO.
ECHO Examples:
ECHO   %~nx0 disable my_ci_workflow
ECHO   %~nx0 enable my_deploy_workflow

:: --- Return To User ---
:end
endlocal
EXIT /B 0
