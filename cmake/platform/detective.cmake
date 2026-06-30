
#==============================================
#     PLATFORM DETECTION AGGREGATE MODULE
#==============================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/platform/detective.cmake
#
# @note
# Intended to be included from the root `CMakeLists.txt` script.
#
# @details
# Consolidates individual platform detection modules into a single
# include.
#
# @author Jamon T. Bailey
# @date 05-07-2026
# --------------------------------------------------------------------

# Include detection modules
include(cmake/platform/architecture.cmake)
include(cmake/platform/operating_sys.cmake)
include(cmake/platform/cpu_features.cmake)

# Output summary of build target platform information
macro(output_${PRJ_PREFIX_L}_target_platform_summary)
    include(cmake/utility/target_summary.cmake)
endmacro()
