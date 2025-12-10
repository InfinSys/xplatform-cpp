
#=====================================================
#     Clang C++ COMPILER CONFIGURATION (clang++)
#=====================================================

# TODO: Setup clang++ compiler configuration (if applicable)

set(${PRJ_PREFIX}_CLANG_CXX_VERSION_MIN 14 CACHE STRING "Minimum clang++ compiler version")

# Confirm supported clang++ compiler version
if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS ${${PRJ_PREFIX}_CLANG_CXX_VERSION_MIN})
    message(FATAL_ERROR "Incompatible version of Clang C++ compiler for ${CMAKE_PROJECT_NAME}.")
endif()

# Compiler feature configuration target
add_library(${PRJ_PREFIX}_clang_cxx_features INTERFACE)
# Compiler diagnostics configuration target
add_library(${PRJ_PREFIX}_clang_cxx_warnings INTERFACE)
# General compiler configuration target
add_library(${PRJ_PREFIX}_clang_cxx_options INTERFACE)
# Preprocessor definitions target
add_library(${PRJ_PREFIX}_clang_cxx_defines INTERFACE)

# Set C++ standard version
target_compile_features(
    ${PRJ_PREFIX}_clang_cxx_features

    INTERFACE
        cxx_std_20
)

# Set compiler warning flags
target_compile_options(
    ${PRJ_PREFIX}_clang_cxx_warnings

    INTERFACE
        # Compiler warning flags
        "-Wall"
        "-Wextra"
        "-Wpedantic"
)

# Conditionally add more aggressive warnings
if(${PRJ_PREFIX}_STRICT_CXX_WARNINGS)
    target_compile_options(
        ${PRJ_PREFIX}_clang_cxx_warnings

        INTERFACE
            "-Werror"
            "-Wshadow"
            "-Wdouble-promotion"
            "-Wformat=2"
    )
endif()

# Conditionally set compiler optimization level
target_compile_options(
    ${PRJ_PREFIX}_clang_cxx_options

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
    ${PRJ_PREFIX}_clang_cxx_defines

    INTERFACE
        # Unconditional preprocessor definitions
        ${PRJ_PREFIX}

        # Preprocessor definitions on debug
        $<$<CONFIG:Debug>:
            _${PRJ_PREFIX}_DEBUG
            ${PRJ_PREFIX}_DEBUG
        >

        # Preprocessor definitions on release
        $<$<CONFIG:Release>:
            ${PRJ_PREFIX}_RELEASE
        >
)

# Complete Clang C++ compiler package
add_library(${PRJ_PREFIX}_clang_cxx_bundle INTERFACE)

target_link_libraries(
    ${PRJ_PREFIX}_clang_cxx_bundle
    
    INTERFACE
        ${PRJ_PREFIX}_clang_cxx_features
        ${PRJ_PREFIX}_clang_cxx_warnings
        ${PRJ_PREFIX}_clang_cxx_options
        ${PRJ_PREFIX}_clang_cxx_defines
)
