
#=======================================
#     PROJECT CMAKE OPTIONS MODULE
#=======================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/project/options.cmake
#
# @note
# Intended to be included from the root `CMakeLists.txt` script,
# generally after the CMake project declaration, but early enough for
# other scripts that depend on these values being appropriately set.
# Options defined on the command line take precedence over the
# defaults defined here.
#
# The defaults seen here represent the expected baseline behavior for
# a fresh configuration with no external overrides applied.
#
# @details
# Defines the project's toggleable build options, which controls
# whether a particular feature, target, or capability is active for
# a given configuration.
#
# @author Jamon T. Bailey
# @date 01-13-2026
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# Project Options
#

# TODO: Setup CMake project options...

option(
    ${PRJ_PREFIX}_CLI_DEBUG
    "Build project CLI sandbox executable."
    OFF
)

option(
    ${PRJ_PREFIX}_UNIT_TEST
    "Build project unit-testing executables."
    OFF
)

option(
    ${PRJ_PREFIX}_BENCHMARK
    "Build project benchmarking executables."
    OFF
)

option(
    ${PRJ_PREFIX}_CLANG_FORMAT
    "Enable project codebase formatting utility target."
    OFF
)

option(
    ${PRJ_PREFIX}_CLANG_TIDY
    "Enable project static analysis utility target."
    OFF
)

# --------------------------------------------------------------------
# Option Summary Emission
#

if(${PRJ_PREFIX}_CLI_DEBUG)
    message(STATUS "${CMAKE_PROJECT_NAME} CLI debug build - enabled")
endif()

if(${PRJ_PREFIX}_UNIT_TEST)
    message(STATUS "${CMAKE_PROJECT_NAME} unit-test builds - enabled")
endif()

if(${PRJ_PREFIX}_BENCHMARK)
    message(STATUS "${CMAKE_PROJECT_NAME} benchmark build - enabled")
endif()
