
#===================================================
#     TARGET OPERATING SYSTEM DETECTION MODULE
#===================================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/platform/operating_sys.cmake
#
# @note
# Intended to be included from the root `CMakeLists.txt` script,
# or through the `cmake/platform/detective.cmake` module, which
# consolidates all platform detection into a single include.
#
# @details
# Interrogates CMake's platform variables to detect and globally
# expose the target operating system, covering both its specific
# identity and POSIX compliance where applicable. These variables
# can then be used throughout the project's CMake scripts to drive
# platform-aware build decisions and conditionally enable
# operating system-specific behavior.
#
# @author Jamon T. Bailey
# @date 05-07-2026
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# OS Identification
#

if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    # Linux-Based Operating System
    set(${PRJ_PREFIX}_OS_LINUX ON CACHE INTERNAL "Target operating system")
    set(${PRJ_PREFIX}_OS_POSIX ON CACHE INTERNAL "POSIX-compliant operating system")
    set(${PRJ_PREFIX}_OS_NAME "Linux" CACHE INTERNAL "Target operating system name")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    # macOS Operating System
    set(${PRJ_PREFIX}_OS_MACOS ON CACHE INTERNAL "Target operating system")
    set(${PRJ_PREFIX}_OS_POSIX ON CACHE INTERNAL "POSIX-compliant operating system")
    set(${PRJ_PREFIX}_OS_NAME "macOS" CACHE INTERNAL "Target operating system name")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    # Windows Operating System
    set(${PRJ_PREFIX}_OS_WINDOWS ON CACHE INTERNAL "Target operating system")
    set(${PRJ_PREFIX}_OS_NAME "Windows" CACHE INTERNAL "Target operating system name")
else()
    message(
        FATAL_ERROR
        "Unrecognized target operating system '${CMAKE_SYSTEM_NAME}'. "
        "Extend 'cmake/platform/operating_sys.cmake' with a matching "
        "handler.\n"
    )
endif()
