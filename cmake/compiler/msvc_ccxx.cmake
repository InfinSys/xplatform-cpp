
#=================================================================
#     MICROSOFT VISUAL C/C++ COMPILER CONFIGURATION (cl.exe)
#=================================================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/compiler/msvc_ccxx.cmake
#
# @note
# Intended to be included from the root `CMakeLists.txt` script,
# generally after the `cmake/compiler/global_cxx.cmake` and
# `cmake/compiler/global_c.cmake` modules have made the global C
# and C++ compiler configurations available as named targets.
# The inclusion of the global C and C++ configurations as well as
# this module can be done manually, or you can simply include the
# `cmake/compiler/config_dispatch.cmake` module to handle all in
# a single step. It is advised to do the latter for portability.
#
# Unlike other compiler configuration modules, which each split C
# and C++ into separate configuration files, MSVC's cl.exe unifies
# both languages under a single toolchain. This makes separation
# impractical within the "per-compiler" module architecture used
# in these configuration modules.
#
# @details
# Assembles both the MSVC C and C++ compiler configuration bundles
# by defining parallel sets of focused interface targets for each,
# covering standard enforcement, warning policy, and optimization
# strategy. A shared preprocessor definitions target is also
# defined and consumed by both bundles, since compiler-level
# symbols are setup to apply uniformly across both languages. Both
# bundles are linked against their respective global configurations,
# and one version check is enforced upfront since cl.exe governs
# both languages.
#
# @author Jamon T. Bailey
# @date 06-09-2025
# --------------------------------------------------------------------

# TODO: Setup cl.exe compiler configuration (if applicable)

set(${PRJ_PREFIX}_MSVC_VERSION_MIN 1940 CACHE STRING "Minimum MSVC compiler version")

# Confirm supported MSVC compiler version
if(MSVC_VERSION VERSION_LESS ${${PRJ_PREFIX}_MSVC_VERSION_MIN})
    message(FATAL_ERROR "Incompatible version of MSVC C/C++ compiler for ${CMAKE_PROJECT_NAME}.")
endif()

# C++ compiler feature configuration target
add_library(${PRJ_PREFIX_L}_msvc_cxx_features INTERFACE)
# C++ compiler diagnostics configuration target
add_library(${PRJ_PREFIX_L}_msvc_cxx_warnings INTERFACE)
# General C++ compiler configuration target
add_library(${PRJ_PREFIX_L}_msvc_cxx_options INTERFACE)

# C compiler feature configuration target
add_library(${PRJ_PREFIX_L}_msvc_c_features INTERFACE)
# C compiler diagnostics configuration target
add_library(${PRJ_PREFIX_L}_msvc_c_warnings INTERFACE)
# General C compiler configuration target
add_library(${PRJ_PREFIX_L}_msvc_c_options INTERFACE)

# C/C++ preprocessor definitions target
add_library(${PRJ_PREFIX_L}_msvc_common_defines INTERFACE)

# Set C++ standard version
target_compile_features(
    ${PRJ_PREFIX_L}_msvc_cxx_features

    INTERFACE
      cxx_std_20
)

# Set C++ standard conformance
target_compile_options(
    ${PRJ_PREFIX_L}_msvc_cxx_options

    INTERFACE
      # C++ ISO standard conformance flag
      "/permissive-"
)

# Set C++ compiler warning flags
target_compile_options(
    ${PRJ_PREFIX_L}_msvc_cxx_warnings

    INTERFACE
      # Compiler warning flags
      # "/W4"
)

# Conditionally add more aggressive warnings
if(${PRJ_PREFIX}_STRICT_CXX_WARNINGS)
    target_compile_options(
        ${PRJ_PREFIX_L}_msvc_cxx_warnings

        INTERFACE
          "/WX"
    )
endif()

if(${PRJ_PREFIX}_STRICT_C_WARNINGS)
    target_compile_options(
        ${PRJ_PREFIX_L}_msvc_c_warnings

        INTERFACE
          "/WX"
    )
endif()

# Conditionally set compiler optimization level
target_compile_options(
    ${PRJ_PREFIX_L}_msvc_cxx_options

    INTERFACE
      # Disable optimization on debug
      $<$<CONFIG:Debug>:
          "/Od"
      >

      # High optimization on release
      $<$<CONFIG:Release>:
          "/O2"
      >
)

target_compile_options(
    ${PRJ_PREFIX_L}_msvc_cxx_options

    INTERFACE
      # Character set flags
      "/source-charset:utf-8"
      "/execution-charset:utf-8"
)

# Define C/C++ preprocessor definitions
target_compile_definitions(
    ${PRJ_PREFIX_L}_msvc_common_defines

    INTERFACE
      # Unconditional preprocessor definitions
      ${PRJ_PREFIX}_MSVC
)

# Complete MSVC C++ compiler package
add_library(${PRJ_PREFIX_L}_msvc_cxx_bundle INTERFACE)
# Complete MSVC C compiler package
add_library(${PRJ_PREFIX_L}_msvc_c_bundle INTERFACE)

target_link_libraries(
    ${PRJ_PREFIX_L}_msvc_cxx_bundle
    
    INTERFACE
      ${PRJ_PREFIX_L}_msvc_cxx_features
      ${PRJ_PREFIX_L}_msvc_cxx_warnings
      ${PRJ_PREFIX_L}_msvc_cxx_options
      ${PRJ_PREFIX_L}_msvc_common_defines
      ${PRJ_PREFIX_L}_global_cxx
)

target_link_libraries(
    ${PRJ_PREFIX_L}_msvc_c_bundle
    
    INTERFACE
      ${PRJ_PREFIX_L}_msvc_c_features
      ${PRJ_PREFIX_L}_msvc_c_warnings
      ${PRJ_PREFIX_L}_msvc_c_options
      ${PRJ_PREFIX_L}_msvc_common_defines
      ${PRJ_PREFIX_L}_global_c
)
