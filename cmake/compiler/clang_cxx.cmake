
#=====================================================
#     Clang C++ COMPILER CONFIGURATION (clang++)
#=====================================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/compiler/clang_cxx.cmake
#
# @note
# Intended to be included from the root `CMakeLists.txt` script,
# generally after the `cmake/compiler/global_cxx.cmake` module has
# made the global C++ compiler configuration available as a named
# target. The inclusion of the global C++ configuration and this
# module can be done manually, or you can simply include the
# `cmake/compiler/config_dispatch.cmake` module to handle both in
# a single step. It is advised to do the latter for portability.
#
# @details
# Assembles the complete clang++ compiler configuration bundle by
# defining focused interface targets covering C++ standard enforcement,
# warning policy, optimization strategy, and Clang-specific preprocessor
# symbols. These individual targets, together with the global C++
# configuration, are consolidated into a single linkable target. This
# module also enforces a minimum compiler version upfront to prevent
# the use of an unsupported toolchain.
#
# @author Jamon T. Bailey
# @date 06-09-2025
# --------------------------------------------------------------------

# TODO: Setup clang++ compiler configuration (if applicable)

set(${PRJ_PREFIX}_CLANG_CXX_VERSION_MIN 14 CACHE STRING "Minimum clang++ compiler version")

# Confirm supported clang++ compiler version
if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS ${${PRJ_PREFIX}_CLANG_CXX_VERSION_MIN})
    message(FATAL_ERROR "Incompatible version of clang++ compiler for ${CMAKE_PROJECT_NAME}.\n")
endif()

# Compiler feature configuration target
add_library(${PRJ_PREFIX_L}_clang_cxx_features INTERFACE)
# Compiler diagnostics configuration target
add_library(${PRJ_PREFIX_L}_clang_cxx_warnings INTERFACE)
# General compiler configuration target
add_library(${PRJ_PREFIX_L}_clang_cxx_options INTERFACE)
# Preprocessor definitions target
add_library(${PRJ_PREFIX_L}_clang_cxx_defines INTERFACE)

# Set C++ standard version
target_compile_features(
    ${PRJ_PREFIX_L}_clang_cxx_features

    INTERFACE
      cxx_std_20
)

# Set compiler warning flags
target_compile_options(
    ${PRJ_PREFIX_L}_clang_cxx_warnings

    INTERFACE
      # Compiler warning flags
      -Wall
      -Wextra
      -Wpedantic
)

# Conditionally add more aggressive warnings
if(${PRJ_PREFIX}_STRICT_CXX_WARNINGS)
    target_compile_options(
        ${PRJ_PREFIX_L}_clang_cxx_warnings

        INTERFACE
          -Werror
          -Wshadow
          -Wdouble-promotion
          -Wformat=2
    )
endif()

# Conditionally set compiler optimization level
target_compile_options(
    ${PRJ_PREFIX_L}_clang_cxx_options

    INTERFACE
      # Disable optimization on debug
      $<$<CONFIG:Debug>:
          -O0
      >

      # High optimization on release
      $<$<CONFIG:Release>:
          -O2
      >
)

# Define preprocessor definitions
target_compile_definitions(
    ${PRJ_PREFIX_L}_clang_cxx_defines

    INTERFACE
      # Unconditional preprocessor definitions
      ${PRJ_PREFIX}_CLANG
)

# Complete Clang C++ compiler package
add_library(${PRJ_PREFIX_L}_clang_cxx_bundle INTERFACE)

target_link_libraries(
    ${PRJ_PREFIX_L}_clang_cxx_bundle
    
    INTERFACE
      ${PRJ_PREFIX_L}_clang_cxx_features
      ${PRJ_PREFIX_L}_clang_cxx_warnings
      ${PRJ_PREFIX_L}_clang_cxx_options
      ${PRJ_PREFIX_L}_clang_cxx_defines
      ${PRJ_PREFIX_L}_global_cxx
)
