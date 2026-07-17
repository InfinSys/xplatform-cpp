
#=========================================
#     TARGET PLATFORM SUMMARY MODULE
#=========================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/utility/target_summary.cmake
#
# @note
# This module emits its summary on inclusion.
#
# This module requires all platform detection variables to be set
# prior to its inclusion because it depends on them to produce a
# summary of the target platform. You can achieve this by including
# the `cmake/platform/detective.cmake` module and using the macro it
# exposes to access this functionality. It is advised you do not
# include this module directly.
# 
#
# @details
# Emits a summary of the detected target platform characteristics to
# the CMake configuration output for an at-a-glance confirmation of
# the platform the build is configured for.
#
# @author Jamon T. Bailey
# @date 05-18-2026
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# Descriptive Helper Variables
#

if(${PRJ_PREFIX}_ARCH_64BIT)
    set(_${PRJ_PREFIX}_summary_bitness "64-bit")
elseif(${PRJ_PREFIX}_ARCH_32BIT)
    set(_${PRJ_PREFIX}_summary_bitness "32-bit")
endif()

if(${PRJ_PREFIX}_ARCH_LITTLE_ENDIAN)
    set(_${PRJ_PREFIX}_summary_endianness "little-endian")
elseif(${PRJ_PREFIX}_ARCH_BIG_ENDIAN)
    set(_${PRJ_PREFIX}_summary_endianness "big-endian")
endif()

if(${PRJ_PREFIX}_OS_POSIX)
    set(_${PRJ_PREFIX}_summary_os_suffix " (POSIX)")
else()
    set(_${PRJ_PREFIX}_summary_os_suffix "")
endif()

# --------------------------------------------------------------------
# Summary Emission
#

message(STATUS "")
message(STATUS "[${CMAKE_PROJECT_NAME} Platform Analysis]")
message(STATUS "\tArchitecture: ${${PRJ_PREFIX}_ARCH_NAME} (${_${PRJ_PREFIX}_summary_bitness}, ${_${PRJ_PREFIX}_summary_endianness})")
message(STATUS "\tOS: ${${PRJ_PREFIX}_OS_NAME}${_${PRJ_PREFIX}_summary_os_suffix}")
message(STATUS "")

# --------------------------------------------------------------------
# Scope Cleanup
#

unset(_${PRJ_PREFIX}_summary_bitness)
unset(_${PRJ_PREFIX}_summary_endianness)
unset(_${PRJ_PREFIX}_summary_os_suffix)
