
#=============================================
#     GCC C COMPILER CONFIGURATION (gcc)
#=============================================

# TODO: Setup gcc compiler configuration (if applicable)

set(${PRJ_PREFIX}_GCC_C_VERSION_MIN 14 CACHE STRING "Minimum gcc compiler version")

# Confirm supported gcc compiler version
if(CMAKE_C_COMPILER_VERSION VERSION_LESS ${${PRJ_PREFIX}_GCC_C_VERSION_MIN})
    message(FATAL_ERROR "Incompatible version of GCC C compiler for ${CMAKE_PROJECT_NAME}.")
endif()

# Compiler feature configuration target
add_library(${PRJ_PREFIX}_gcc_c_features INTERFACE)
# Compiler diagnostics configuration target
add_library(${PRJ_PREFIX}_gcc_c_warnings INTERFACE)
# General compiler configuration target
add_library(${PRJ_PREFIX}_gcc_c_options INTERFACE)
# Preprocessor definitions target
add_library(${PRJ_PREFIX}_gcc_c_defines INTERFACE)

# Set C standard version
target_compile_features(
    ${PRJ_PREFIX}_gcc_c_features

    INTERFACE
        c_std_11
)

# Set compiler warning flags
target_compile_options(
    ${PRJ_PREFIX}_gcc_c_warnings

    INTERFACE
        # Compiler warning flags
        "-Wall"
        "-Wextra"
        "-Wpedantic"
)

# Conditionally add more aggressive warnings
if(${PRJ_PREFIX}_STRICT_C_WARNINGS)
    target_compile_options(
        ${PRJ_PREFIX}_gcc_c_warnings

        INTERFACE
            "-Werror"
            "-Wshadow"
            "-Wdouble-promotion"
            "-Wformat=2"
    )
endif()

# Conditionally set compiler optimization level
target_compile_options(
    ${PRJ_PREFIX}_gcc_c_options

    INTERFACE
        # Disable optimization on debug
        $<$<CONFIG:Debug>:
            "-O0"
        >

        # High optimization on release
        $<$<CONFIG:Release>:
            "-O2"
        >
)

# Define preprocessor definitions
target_compile_definitions(
    ${PRJ_PREFIX}_gcc_c_defines

    INTERFACE
        # Unconditional preprocessor definitions
        ${PRJ_PREFIX}_C_LANG

        # Preprocessor definitions on debug
        $<$<CONFIG:Debug>:
            _${PRJ_PREFIX}_C_DEBUG
            ${PRJ_PREFIX}_C_DEBUG
        >

        # Preprocessor definitions on release
        $<$<CONFIG:Release>:
            ${PRJ_PREFIX}_C_RELEASE
        >
)

# Complete GCC C compiler package
add_library(${PRJ_PREFIX}_gcc_c_bundle INTERFACE)

target_link_libraries(
    ${PRJ_PREFIX}_gcc_c_bundle
    
    INTERFACE
        ${PRJ_PREFIX}_gcc_c_features
        ${PRJ_PREFIX}_gcc_c_warnings
        ${PRJ_PREFIX}_gcc_c_options
        ${PRJ_PREFIX}_gcc_c_defines
)
