
#============================================
#     PROJECT METADATA UTILITIES MODULE
#============================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/utility/metadata_utils.cmake
#
# @note
# This module is intended to be included and used exclusively by the
# `cmake/project/metadata.cmake` module.
#
# @details
# Defines low-level utility primitives for the project metadata
# configuration and code generation pipeline. These handle storing
# and tracking named metadata fields as temporary cache variables,
# and cleaning up temporary cache state once generation is complete.
#
# @author Jamon T. Bailey
# @date 06-07-2025
# --------------------------------------------------------------------

# Create list that stores temporarily cached variable names
macro(create_${PRJ_PREFIX_L}_temporary_cache_list)
    set(_${PRJ_PREFIX}_temp_cache_vars "")
endmacro()

# Cache arbitrary project metadata to CMake cache
function(set_${PRJ_PREFIX_L}_metadata FIELD VALUE)
    cmake_parse_arguments(PARSE_ARGV 2 ARG "" "DESCRIPTION" "")

    if(NOT FIELD)
        message(FATAL_ERROR "No field name provided for metadata value: '${VALUE}'")
    endif()

    if(NOT ARG_DESCRIPTION)
        set(ARG_DESCRIPTION "No description provided for '${FIELD}'")
    endif()

    set(_${PRJ_PREFIX}_${FIELD} "${VALUE}" CACHE STRING "${ARG_DESCRIPTION}" FORCE)
endfunction()

# Cache a temporary short-named variable for use in file configuration
macro(create_${PRJ_PREFIX_L}_template_reference REF_NAME REF_KEY)
    if(REF_NAME STREQUAL "")
        message(FATAL_ERROR "No reference name provided for '${_${PRJ_PREFIX}_${REF_KEY}}' value.")
    endif()
    
    # Note: 'REF_NAME' provided is prefixed with 'RESOLVED_'
    set(RESOLVED_${REF_NAME} ${_${PRJ_PREFIX}_${REF_KEY}} CACHE STRING "Temporary" FORCE)
    list(APPEND _${PRJ_PREFIX}_temp_cache_vars RESOLVED_${REF_NAME})
endmacro()

# Configure a template file referencing cached CMake variables
macro(configure_${PRJ_PREFIX_L}_template TEMPLATE_PATH DESTINATION_PATH)
    configure_file(${TEMPLATE_PATH} ${DESTINATION_PATH} @ONLY)
    message(STATUS "Generated file: ${DESTINATION_PATH}")
endmacro()

# Remove temporarily cached short-name variables
macro(remove_${PRJ_PREFIX_L}_temporary_cache_list)
    foreach(TEMPVAR ${_${PRJ_PREFIX}_temp_cache_vars})
        unset(${TEMPVAR} CACHE)
    endforeach()

    unset(_${PRJ_PREFIX}_temp_cache_vars)
endmacro()
