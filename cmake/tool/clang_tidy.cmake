
#==========================================
#     CLANG-TIDY UTILITY TARGET SETUP
#==========================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/tool/clang_tidy.cmake
#
# @note
# This module requires the host machine have clang-tidy installed or
# the utility target creation will be skipped.
#
# Utility targets do not automatically run during CMake configuration
# or build, you must manually invoke the utility at the command line
# using `cmake --build --target <UTILITY_TARGET>`, or use convenience
# functionality your IDE provides for building individual CMake
# targets.
#
# @details
# Defines a custom build target that runs clang-tidy across the
# project's source and header files using a `.clang-tidy`
# configuration to provide a convenient on-demand static analysis
# pass over the entire codebase.
#
# @author Jamon T. Bailey
# @date 12-10-2025
# --------------------------------------------------------------------

# Confirm existing clang-tidy installation
find_program(${PRJ_PREFIX}_CLANG_TIDY_EXECUTABLE clang-tidy)

if(NOT ${PRJ_PREFIX}_CLANG_TIDY_EXECUTABLE)
    message(WARNING "clang-tidy not found: Cannot create static analysis target.\n")
    return()
endif()

# --------------------------------------------------------------------
# Configuration
#

# TODO: Configure clang-tidy utility target...

# Header directories to search recursively
set(
    _${PRJ_PREFIX}_header_paths

    "${CMAKE_SOURCE_DIR}/include/*.h"
    "${CMAKE_SOURCE_DIR}/include/*.hpp"
    "${CMAKE_SOURCE_DIR}/lib/*.h"
    "${CMAKE_SOURCE_DIR}/lib/*.hpp"
)

# Source directories to search recursively
set(
    _${PRJ_PREFIX}_source_paths

    "${CMAKE_SOURCE_DIR}/src/*.c"
    "${CMAKE_SOURCE_DIR}/src/*.cpp"
    "${CMAKE_SOURCE_DIR}/lib/*.c"
    "${CMAKE_SOURCE_DIR}/lib/*.cpp"
)

# --------------------------------------------------------------------
# Config File Check
#

# clang-tidy config file path
set(_${PRJ_PREFIX}_clang_tidy_config "${CMAKE_SOURCE_DIR}/.clang-tidy")

# Check if clang-tidy configuration file exists
if(NOT EXISTS "${_${PRJ_PREFIX}_clang_tidy_config}")
    message(
        WARNING
        "No clang-tidy configuration file located at: "
        "${_${PRJ_PREFIX}_clang_tidy_config}\n"
        "Cannot create static analysis target.\n"
    )

    unset(_${PRJ_PREFIX}_header_paths)
    unset(_${PRJ_PREFIX}_source_paths)
    unset(_${PRJ_PREFIX}_clang_tidy_config)
    return()
endif()

# --------------------------------------------------------------------
# Source Collection
#

# Collect all source files
file(
    GLOB_RECURSE _${PRJ_PREFIX}_source_files

    CONFIGURE_DEPENDS
      ${_${PRJ_PREFIX}_source_paths}
)

# Collect all header files
file(
    GLOB_RECURSE _${PRJ_PREFIX}_header_files

    CONFIGURE_DEPENDS
      ${_${PRJ_PREFIX}_header_paths}
)

# --------------------------------------------------------------------
# Utility Target
#

add_custom_target(
    ${PRJ_PREFIX_L}_clang_tidy

    COMMAND
      ${${PRJ_PREFIX}_CLANG_TIDY_EXECUTABLE}
      ${_${PRJ_PREFIX}_source_files}
      ${_${PRJ_PREFIX}_header_files}
      -p ${CMAKE_BINARY_DIR}
      "--config-file=${_${PRJ_PREFIX}_clang_tidy_config}"
      "-system-headers=false"
    
    COMMENT
      "Running Clang-Tidy on source files..."

    VERBATIM
)

# --------------------------------------------------------------------
# Scope Cleanup
#

unset(_${PRJ_PREFIX}_header_paths)
unset(_${PRJ_PREFIX}_source_paths)
unset(_${PRJ_PREFIX}_clang_tidy_config)
unset(_${PRJ_PREFIX}_source_files)
unset(_${PRJ_PREFIX}_header_files)
