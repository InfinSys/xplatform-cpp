
#============================================
#     PROJECT METADATA UTILITIES MODULE
#============================================

# Remove temporarily cached short-name variables
macro(clear_temporary_cache)
    foreach(TEMPVAR ${TEMP_CACHE_VARS})
        unset(${TEMPVAR} CACHE)
    endforeach()
endmacro()

# Configure a template file referencing cached CMake variables
macro(configure_template TEMPLATE_PATH DESTINATION_PATH)
    configure_file(
        ${TEMPLATE_PATH}
        ${DESTINATION_PATH}
        @ONLY
    )

    message(STATUS "Configured file: ${DESTINATION_PATH}")
endmacro()

# Cache a temporary short-named variable for use in file configuration
macro(create_template_reference REF_NAME REF_KEY)
    if(REF_NAME STREQUAL "")
        message(FATAL_ERROR "No reference name provided for '${${PRJ_SCOPE}_${REF_KEY}}' value.")
    endif()
    
    # NOTE: 'REF_NAME' provided is prefixed with 'RESOLVED_'
    set(RESOLVED_${REF_NAME} ${${PRJ_SCOPE}_${REF_KEY}} CACHE STRING "Temporary" FORCE)
    list(APPEND TEMP_CACHE_VARS RESOLVED_${REF_NAME})
endmacro()

# Cache arbitrary project metadata to CMake cache
macro(set_metadata FIELD VALUE)
    cmake_parse_arguments(
        ARGSS
        ""
        "DESCRIPTION"
        ""
        ${ARGN}
    )

    if(FIELD STREQUAL "")
        message(FATAL_ERROR "No name provided for metadata value: ${VALUE}")
    endif()

    if(ARGSS_DESCRIPTION STREQUAL "")
        set(ARGSS_DESCRIPTION "No description provided for '${FIELD}'")
    endif()

    set(${PRJ_SCOPE}_${FIELD} "${VALUE}" CACHE STRING "${ARGSS_DESCRIPTION}" FORCE)
endmacro()
