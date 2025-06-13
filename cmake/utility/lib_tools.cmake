
# Add precompiled static or shared library target (shared libs: Linux and macOS)
macro(add_external_library TARGET_NAME LIB_TYPE LIB_PATH)
    cmake_parse_arguments(
        ARGSS
        ""
        ""
        "INCLUDE"
        ${ARGN}
    )

    string(TOUPPER "${LIB_TYPE}" LIB_TYPE)

    add_library(${TARGET_NAME} ${LIB_TYPE} IMPORTED)

    if(NOT ARGSS_INCLUDE)
        set_target_properties(
            ${TARGET_NAME}
            PROPERTIES

            IMPORTED_LOCATION
            "${LIB_PATH}"
        )
    else()
        set_target_properties(
            ${TARGET_NAME}
            PROPERTIES

            IMPORTED_LOCATION
            "${LIB_PATH}"

            INTERFACE_INCLUDE_DIRECTORIES
            ${ARGSS_INCLUDE}
        )
    endif()
endmacro()
