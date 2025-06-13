
# Add precompiled static or shared library target
macro(add_external_library TARGET_NAME LIB_TYPE LIB_PATH)
    cmake_parse_arguments(
        ARGSS
        ""
        "IMPORT_LIB"
        "INCLUDE"
        ${ARGN}
    )

    string(TOUPPER "${LIB_TYPE}" LIB_TYPE)

    add_library(${TARGET_NAME} ${LIB_TYPE} IMPORTED)

    if(NOT ARGSS_INCLUDE)
        if(NOT ARGSS_IMPORT_LIB)
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

                IMPORTED_IMPLIB
                "${ARGSS_IMPORT_LIB}"

                IMPORTED_LOCATION
                "${LIB_PATH}"
            )
        endif()
    else()
        if(NOT ARGSS_IMPORT_LIB)
            set_target_properties(
                ${TARGET_NAME}
                PROPERTIES

                IMPORTED_LOCATION
                "${LIB_PATH}"

                INTERFACE_INCLUDE_DIRECTORIES
                "${ARGSS_INCLUDE}"
            )
        else()
            set_target_properties(
                ${TARGET_NAME}
                PROPERTIES

                IMPORTED_IMPLIB
                "${ARGSS_IMPORT_LIB}"

                IMPORTED_LOCATION
                "${LIB_PATH}"

                INTERFACE_INCLUDE_DIRECTORIES
                "${ARGSS_INCLUDE}"
            )
        endif()
    endif()
endmacro()

# If Linux/macOS adding shared library:
# add_external_library(
#     TestLib
#     SHARED
#     "./lib/testlib/libtest.so"
# 
#     INCLUDE
#     ${PRJ_INCLUDE_DIRS}
# )

# If Windows adding shared library:
# add_external_library(
#     TestLib
#     SHARED
#     "./lib/testlib/test.dll"
# 
#     IMPORT_LIB
#     "./lib/testlib/test.lib"
# 
#     INCLUDE
#     ${PRJ_INCLUDE_DIRS}
# )
