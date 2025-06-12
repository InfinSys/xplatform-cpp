#!/bin/bash

# This script enables or disables a GitHub Actions Workflow.
# It moves the Workflow .yml file between the .github/workflows/
# directory and the .github/disabled_workflows/ directory to
# achieve this.

GITHUB_DIR=".github"
WORKFLOWS_SUBDIR="workflows"
WORKFLOWS_PATH="${GITHUB_DIR}/${WORKFLOWS_SUBDIR}"
DISABLED_WORKFLOWS_PATH="${GITHUB_DIR}/disabled_workflows"

# --- Usage Instructions ---
usage() {
    echo ""
    echo "Usage: $(basename "$0") [enable|disable] [workflow_filename]"
    echo ""
    echo "   [enable]: Enables the specified GitHub Workflow by moving it from .github/disabled_workflows/ to .github/workflows/"
    echo "  [disable]: Disables the specified GitHub Workflow by moving it from .github/workflows/ to .github/disabled_workflows/"
    echo ""
    echo "Examples:"
    echo "  $(basename "$0") disable my_ci_workflow"
    echo "  $(basename "$0") enable my_deploy_workflow"
    echo ""
}


if [ -z "$1" ] || [ -z "$2" ]; then
    usage
    exit 1
fi

ACTION="$1"
WORKFLOW_FILE="$2"

ENABLED_FILE_PATH="${WORKFLOWS_PATH}/${WORKFLOW_FILE}.yml"
DISABLED_FILE_PATH="${DISABLED_WORKFLOWS_PATH}/${WORKFLOW_FILE}.yml"

cd "$(dirname "$0")/.." || { echo "Error: Could not change directory to parent. Ensure the script is run within a Git repository."; exit 1; }

if [ ! -f "${ENABLED_FILE_PATH}" ] && [ ! -f "${DISABLED_FILE_PATH}" ]; then
    echo ""
    echo "Error: No such GitHub Workflows specification \"${WORKFLOW_FILE}.yml\" exists!"
    echo ""
    exit 1
fi

ACTION_LOWER=$(echo "$ACTION" | tr '[:upper:]' '[:lower:]')

if [ "$ACTION_LOWER" == "disable" ]; then
    if [ -f "${DISABLED_FILE_PATH}" ]; then
        echo ""
        echo "The \"${WORKFLOW_FILE}\" Workflow is ALREADY disabled!"
        echo "Found in: \"${DISABLED_WORKFLOWS_PATH}\""
        echo "No action needed."
        echo ""
    else
        echo ""
        echo "Attempting to disable \"${WORKFLOW_FILE}\" GitHub Workflow:"

        echo "Moving \"${WORKFLOW_FILE}.yml\" to \"${DISABLED_FILE_PATH}\"..."

        # Create 'disabled_workflows' directory if it doesn't exist
        if [ ! -d "${DISABLED_WORKFLOWS_PATH}" ]; then
            echo "Creating disabled GitHub Workflow directory..."

            mkdir -p "${DISABLED_WORKFLOWS_PATH}"
            if [ $? -ne 0 ]; then
                echo ""
                echo "Error: FAILED to create directory \"${WORKFLOWS_PATH}\". Check permissions."
                echo ""
                exit 1
            fi
        fi
        
        # Move the Workflow file to disable it
        mv "${ENABLED_FILE_PATH}" "${DISABLED_FILE_PATH}" > /dev/null
        if [ $? -ne 0 ]; then
            echo ""
            echo "Error: FAILED to move \"${WORKFLOW_FILE}\". Check permissions or if the file is in use."
            echo ""
            exit 1
        else
            echo ""
            echo "Disabled \"${WORKFLOW_FILE}\" GitHub Workflow successfully."
            echo ""
        fi
    fi
elif [ "$ACTION_LOWER" == "enable" ]; then
    if [ -f "${ENABLED_FILE_PATH}" ]; then
        echo ""
        echo "The \"${WORKFLOW_FILE}\" Workflow is ALREADY enabled!"
        echo "Found in: \"${WORKFLOWS_PATH}\""
        echo "No action needed."
        echo ""
    else
        echo ""
        echo "Attempting to enable \"${WORKFLOW_FILE}\" GitHub Workflow:"

        # Create 'workflows' directory if it doesn't exist
        if [ ! -d "${WORKFLOWS_PATH}" ]; then
            echo "Creating GitHub Workflow directory..."

            mkdir -p "${WORKFLOWS_PATH}"
            if [ $? -ne 0 ]; then
                echo ""
                echo "Error: FAILED to create directory \"${WORKFLOWS_PATH}\". Check permissions."
                echo ""
                exit 1
            fi
        fi

        # Move the Workflow file to enable it
        echo "Moving \"${WORKFLOW_FILE}.yml\" to \"${ENABLED_FILE_PATH}\"..."

        mv "${DISABLED_FILE_PATH}" "${ENABLED_FILE_PATH}" > /dev/null
        if [ $? -ne 0 ]; then
            echo ""
            echo "Error: FAILED to move \"${WORKFLOW_FILE}\". Check permissions or if the file is in use."
            echo ""
            exit 1
        else
            echo ""
            echo "Enabled \"${WORKFLOW_FILE}\" GitHub Workflow successfully."
            echo ""
        fi
    fi
else
    echo ""
    echo "Error: Invalid state argument \"${ACTION}\"."
    usage
    exit 1
fi

exit 0
