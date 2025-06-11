
#====================================
#     GENERAL PROJECT UTILITIES
#====================================

# Set the C++ standard of a target
macro(set_cxx_standard TARGET)
    cmake_parse_arguments(
        ARGSS
        "PUBLIC;PRIVATE;INTERFACE"
        ""
        ""
        ${ARGN}
    )

    list(LENGTH ARGSS_UNPARSED_ARGUMENTS ARG_COUNT)

    if(ARG_COUNT EQUAL 0 OR ARG_COUNT GREATER 1)
        message(FATAL_ERROR "Invalid number of arguments provided to 'set_cxx_standard()'.")
    endif()

    set(STANDARD_NUMBER ${ARGSS_UNPARSED_ARGUMENTS})

    if(ARGSS_INTERFACE)
        target_compile_features(
            ${TARGET}

            INTERFACE
            cxx_std_${STANDARD_NUMBER}
        )
    elseif(ARGSS_PUBLIC)
        target_compile_features(
            ${TARGET}

            PUBLIC
            cxx_std_${STANDARD_NUMBER}
        )
    elseif(ARGSS_PRIVATE)
        target_compile_features(
            ${TARGET}

            PRIVATE
            cxx_std_${STANDARD_NUMBER}
        )
    else()
        message(FATAL_ERROR "No propogation property provided for '${TARGET}' target")
    endif()
endmacro()
