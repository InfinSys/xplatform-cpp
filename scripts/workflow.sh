#!/bin/bash

# This script enables or disables a GitHub Actions workflow.
# It moves the workflow .yml file between the .github/workflows/
# directory and the .github/ root directory to achieve this.

GITHUB_DIR=".github"
WORKFLOWS_SUBDIR="workflows"
WORKFLOWS_PATH="${GITHUB_DIR}/${WORKFLOWS_SUBDIR}"

# --- Usage Instructions ---
usage() {
    echo ""
    echo "Usage: $(basename "$0") [true|false] [workflow_filename]"
    echo ""
    echo "   [true]: Enables the specified GitHub Workflow by moving it from .github/ to .github/workflows/"
    echo "  [false]: Disables the specified GitHub Workflow by moving it from .github/workflows/ to .github/"
    echo ""
    echo "Examples:"
    echo "  $(basename "$0") false my_ci_workflow"
    echo "  $(basename "$0") true my_deploy_workflow"
    echo ""
}


if [ -z "$1" ] || [ -z "$2" ]; then
    usage
    exit 1
fi

ACTION="$1"
WORKFLOW_FILE="$2"

ENABLED_FILE_PATH="${WORKFLOWS_PATH}/${WORKFLOW_FILE}.yml"
DISABLED_FILE_PATH="${GITHUB_DIR}/${WORKFLOW_FILE}.yml"

cd "$(dirname "$0")/.." || { echo "Error: Could not change directory to parent. Ensure the script is run within a Git repository."; exit 1; }

if [ ! -f "${ENABLED_FILE_PATH}" ] && [ ! -f "${DISABLED_FILE_PATH}" ]; then
    echo ""
    echo "Error: No such GitHub Workflows specification \"${WORKFLOW_FILE}.yml\" exists!"
    exit 1
fi

ACTION_LOWER=$(echo "$ACTION" | tr '[:upper:]' '[:lower:]')

if [ "$ACTION_LOWER" == "false" ]; then
    if [ -f "${DISABLED_FILE_PATH}" ]; then
        echo ""
        echo "The \"${WORKFLOW_FILE}\" Workflow is ALREADY disabled!"
        echo "Found in: \"${GITHUB_DIR}\""
        echo "No action needed."
    else
        echo ""
        echo "Attempting to disable \"${WORKFLOW_FILE}\" GitHub Workflow:"

        # Move the Workflow file to disable it
        echo "Moving \"${ENABLED_FILE_PATH}\" to \"${DISABLED_FILE_PATH}\"..."
        
        mv "${ENABLED_FILE_PATH}" "${DISABLED_FILE_PATH}" > /dev/null
        if [ $? -ne 0 ]; then
            echo ""
            echo "Error: FAILED to move \"${WORKFLOW_FILE}\". Check permissions or if the file is in use."
            exit 1
        else
            echo ""
            echo "Disabled \"${WORKFLOW_FILE}\" GitHub Workflow successfully."
        fi
    fi
elif [ "$ACTION_LOWER" == "true" ]; then
    if [ -f "${ENABLED_FILE_PATH}" ]; then
        echo ""
        echo "The \"${WORKFLOW_FILE}\" Workflow is ALREADY enabled!"
        echo "Found in \"${WORKFLOWS_PATH}\""
        echo "No action needed."
    else
        echo ""
        echo "Attempting to enable \"${WORKFLOW_FILE}\" GitHub Workflow:"

        # Create 'workflows' directory if it doesn't exist
        if [ ! -d "${WORKFLOWS_PATH}" ]; then
            echo "Creating GitHub Workflow directory \"${WORKFLOWS_PATH}\"..."

            mkdir -p "${WORKFLOWS_PATH}"
            if [ $? -ne 0 ]; then
                echo ""
                echo "Error: FAILED to create directory \"${WORKFLOWS_PATH}\". Check permissions."
                exit 1
            fi
        fi

        # Move the Workflow file to enable it
        echo "Moving \"${DISABLED_FILE_PATH}\" to \"${ENABLED_FILE_PATH}\"..."

        mv "${DISABLED_FILE_PATH}" "${ENABLED_FILE_PATH}" > /dev/null
        if [ $? -ne 0 ]; then
            echo ""
            echo "Error: FAILED to move \"${WORKFLOW_FILE}\". Check permissions or if the file is in use."
            exit 1
        else
            echo ""
            echo "Enabled \"${WORKFLOW_FILE}\" GitHub Workflow successfully."
        fi
    fi
else
    echo ""
    echo "Error: Invalid state argument \"${ACTION}\"."
    usage
    exit 1
fi

exit 0
