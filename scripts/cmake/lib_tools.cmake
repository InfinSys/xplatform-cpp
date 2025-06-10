
# Add precompiled static library target
macro(add_external_static TARGET_NAME LIB_PATH)
    add_library(${TARGET_NAME} STATIC IMPORTED)
    set_target_properties(
        ${TARGET_NAME}
        PROPERTIES

        IMPORTED_LOCATION
        "${LIB_PATH}"
    )
endmacro()
