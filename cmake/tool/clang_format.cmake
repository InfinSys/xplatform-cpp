
#============================================
#     CLANG-FORMAT UTILITY TARGET SETUP
#============================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/tool/clang_format.cmake
#
# @note
# This module requires the host machine have clang-format installed
# or the utility target creation will be skipped.
#
# The utility target invokes clang-format in the project's root
# directory where a `.clang-format` configuration file should be
# present.
#
# Utility targets do not automatically run during CMake configuration
# or build, you must manually invoke the utility at the command line
# using `cmake --build --target <UTILITY_TARGET>`, or use convenience
# functionality your IDE provides for building individual CMake
# targets.
#
# @details
# Defines a custom build target that recursively collects source
# files across the project's directories and runs clang-format on
# them in-place for a convenient on-demand formatting pass over
# the entire codebase. 
#
# @author Jamon T. Bailey
# @date 05-08-2025
# --------------------------------------------------------------------

# Confirm existing clang-format installation
find_program(${PRJ_PREFIX}_CLANG_FORMAT_EXECUTABLE clang-format)

if(NOT ${PRJ_PREFIX}_CLANG_FORMAT_EXECUTABLE)
    message(WARNING "clang-format not found: Cannot create source format target.\n")
    return()
endif()

# --------------------------------------------------------------------
# Configuration
#

# TODO: Configure clang-format utility target...

# Source directories to search recursively
set(
    _${PRJ_PREFIX}_source_dirs

    "${CMAKE_SOURCE_DIR}/lib"
    "${CMAKE_SOURCE_DIR}/include"
    "${CMAKE_SOURCE_DIR}/src"
)

# Source file extensions to target
set(
    _${PRJ_PREFIX}_source_extensions

    *.h
    *.c
    *.hpp
    *.cpp
)

# --------------------------------------------------------------------
# Source Collection
#

# Resolved file paths to be formatted
set(_${PRJ_PREFIX}_format_file_list "")

# Collect matching file paths from search directories
foreach(DIR ${_${PRJ_PREFIX}_source_dirs})
    foreach(EXTENSION ${_${PRJ_PREFIX}_source_extensions})
        # Get all file paths within DIR ending with EXTENSION
        file(
            GLOB_RECURSE _${PRJ_PREFIX}_files_found

            CONFIGURE_DEPENDS
              "${DIR}/${EXTENSION}"
        )

        # Add globbed file paths to format list
        list(APPEND _${PRJ_PREFIX}_format_file_list ${_${PRJ_PREFIX}_files_found})
    endforeach()
endforeach()

# --------------------------------------------------------------------
# Utility Target
#

# Create clang-format utility target
add_custom_target(
    ${PRJ_PREFIX_L}_clang_format

    COMMAND
      ${${PRJ_PREFIX}_CLANG_FORMAT_EXECUTABLE} -i ${_${PRJ_PREFIX}_format_file_list}

    WORKING_DIRECTORY
      ${CMAKE_SOURCE_DIR}

    COMMENT
      "Running clang-format on source files..."
    
    VERBATIM
)

# --------------------------------------------------------------------
# Scope Cleanup
#

unset(_${PRJ_PREFIX}_source_dirs)
unset(_${PRJ_PREFIX}_source_extensions)
unset(_${PRJ_PREFIX}_format_file_list)
unset(_${PRJ_PREFIX}_files_found)
