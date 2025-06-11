
#============================================
#     PROJECT METADATA UTILITIES MODULE
#============================================

# Configure a templated file
macro(configure_template TEMPLATE_PATH DESTINATION_PATH)
    configure_file(
        ${TEMPLATE_PATH}
        ${DESTINATION_PATH}
        @ONLY
    )

    message(STATUS "Configured file: ${DESTINATION_PATH}")
endmacro()

# Cache project metadata
macro(set_metadata FIELD VALUE)
    cmake_parse_arguments(
        ARGSS
        ""
        "DESCRIPTION"
        ""
        ${ARGN}
    )

    if(ARGSS_DESCRIPTION STREQUAL "")
        set(ARGSS_DESCRIPTION "No description provided for '${FIELD}'")
    endif()

    set(${PRJ_SCOPE}_${FIELD} "${VALUE}" CACHE STRING "${ARGSS_DESCRIPTION}" FORCE)
endmacro()

# Cache a temporary simplified variable for use in file configuration
macro(create_template_reference REF_NAME REF_KEY)
    if(REF_NAME STREQUAL "")
        message(FATAL_ERROR "No reference name provided for '${${PRJ_SCOPE}_${REF_KEY}}' value")
    endif()
    
    set(RESOLVED_${REF_NAME} ${${PRJ_SCOPE}_${REF_KEY}} CACHE STRING "Temporary" FORCE)
    list(APPEND TEMP_CACHE_VARS RESOLVED_${REF_NAME})
endmacro()

# Remove temporarily cached variables
macro(clear_temporary_cache)
    foreach(TEMPVAR ${TEMP_CACHE_VARS})
        unset(${TEMPVAR} CACHE)
    endforeach()
endmacro()
