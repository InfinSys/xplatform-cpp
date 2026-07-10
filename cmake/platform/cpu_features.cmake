
#=============================================
#     PROCESSOR FEATURE DEDUCTION MODULE
#=============================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/platform/cpu_features.cmake
#
# @note
# Intended to be included from the root `CMakeLists.txt` script,
# after all other platform detection modules have been included,
# or through the `cmake/platform/detective.cmake` module, which
# consolidates all platform detection into a single include using
# the appropriate order.
#
# @details
# Deduces the processor's available feature set and globally exposes
# the results for use throughout the project's CMake scripts to drive
# architecture-aware build decisions and conditionally enable
# CPU-specific behavior.
#
# @author Jamon T. Bailey
# @date 05-07-2026
# --------------------------------------------------------------------

# TODO: Setup CPU feature detection...

# You can assume other platform detection variables
# have been set and are readily available for use.
# The platform detective module ensures that the CPU
# features detection is always the last thing to be
# interrogated, so previously set variables will be
# accessible at this point.

# This part is arbitrary and depends on what the
# project in question seeks to know about the target
# platforms CPU.
