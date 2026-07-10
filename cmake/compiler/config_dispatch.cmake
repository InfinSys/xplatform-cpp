
#==================================================
#     PROJECT COMPILER CONFIGURATION DISPATCH
#==================================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/compiler/config_dispatch.cmake
#
# @note
# Intended to be included from the root `CMakeLists.txt` script to
# propogate module effects to all sub-directories.
#
# MSVC is treated as a dedicated special case ahead of the standard
# detection blocks since cl.exe unifies both C and C++ under a single
# compiler.
#
# @details
# Automates compiler configuration by detecting the active language
# toolchains and including both the appropriate compiler-specific
# modules and their shared global configurations.
#
# @author Jamon T. Bailey
# @date 06-09-2025
# --------------------------------------------------------------------

# Include global C compiler configuration module
include(cmake/compiler/global_c.cmake)
# Include global C++ compiler configuration module
include(cmake/compiler/global_cxx.cmake)

# Include MSVC compiler configuration module
if(CMAKE_C_COMPILER_ID STREQUAL "MSVC" OR CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    # MSVC C/C++ compiler
    set(${PRJ_PREFIX}_C_MSVC TRUE)
    set(${PRJ_PREFIX}_CXX_MSVC TRUE)
    # MSVC unifies C and C++ under single compiler
    include(cmake/compiler/msvc_ccxx.cmake)
    return()
endif()

# Include C compiler configuration module
if(CMAKE_C_COMPILER_ID)
    if(CMAKE_C_COMPILER_ID STREQUAL "GNU")
        # GCC C compiler
        set(${PRJ_PREFIX}_C_GCC TRUE)
        include(cmake/compiler/gcc_c.cmake)
    elseif(CMAKE_C_COMPILER_ID MATCHES "(Apple)?[Cc]lang")
        # Clang C compiler
        set(${PRJ_PREFIX}_C_CLANG TRUE)
        include(cmake/compiler/clang_c.cmake)
    else()
        message(
            FATAL_ERROR
            "A configuration module is required to compile "
            "${CMAKE_PROJECT_NAME} with ${CMAKE_C_COMPILER_ID} "
            "C compiler.\n"
        )
    endif()
endif()

# Include C++ compiler configuration module
if(CMAKE_CXX_COMPILER_ID)
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        # GCC C++ compiler
        set(${PRJ_PREFIX}_CXX_GCC TRUE)
        include(cmake/compiler/gcc_cxx.cmake)
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "(Apple)?[Cc]lang")
        # Clang C++ compiler
        set(${PRJ_PREFIX}_CXX_CLANG TRUE)
        include(cmake/compiler/clang_cxx.cmake)
    else()
        message(
            FATAL_ERROR
            "A configuration module is required to compile "
            "${CMAKE_PROJECT_NAME} with ${CMAKE_CXX_COMPILER_ID} "
            "C++ compiler.\n"
        )
    endif()
endif()
