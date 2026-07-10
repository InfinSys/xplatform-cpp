
#============================================
#     GLOBAL C++ COMPILER CONFIGURATION
#============================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/compiler/global_cxx.cmake
#
# @details
# Defines the global C++ compiler configuration interface target,
# which carries compiler-agnostic configurations applied uniformly
# across all C++ compilation units. All C++ compiler configuration
# bundles link against this target to avoid duplicating shared
# settings across each compiler configuration.
#
# @author Jamon T. Bailey
# @date 01-13-2026
# --------------------------------------------------------------------

# Global C++ configuration target
add_library(${PRJ_PREFIX_L}_global_cxx INTERFACE)

# Define preprocessor definitions
target_compile_definitions(
    ${PRJ_PREFIX_L}_global_cxx

    INTERFACE
      # Unconditional preprocessor definitions
      ${PRJ_PREFIX}

      # Preprocessor definitions on debug
      $<$<CONFIG:Debug>:
          ${PRJ_PREFIX}_DEBUG
      >

      # Preprocessor definitions on release
      $<$<CONFIG:Release>:
          ${PRJ_PREFIX}_RELEASE
      >
)
