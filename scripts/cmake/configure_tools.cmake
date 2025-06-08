
#==================================================
#     PROJECT FILE CONFIGURE UTILITIES MODULE
#==================================================

# Configure a templated file
macro(configure_template TEMPLATE_PATH DESTINATION_PATH)
    configure_file(
        ${TEMPLATE_PATH}
        ${DESTINATION_PATH}
        @ONLY
    )

    message(STATUS "Configured file: ${DESTINATION_PATH}")
endmacro()
