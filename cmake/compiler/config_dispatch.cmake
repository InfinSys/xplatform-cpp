
#==================================================
#     PROJECT COMPILER CONFIGURATION DISPATCH
#==================================================

# This script should be invoked from the root
# CMakeLists.txt file.

# Include current C compiler configuration script
if(CMAKE_C_COMPILER_ID STREQUAL "GNU")
    # GCC C compiler
    set(${PRJ_PREFIX}_C_GCC TRUE)
    include(cmake/compiler/gcc_c.cmake)
elseif(CMAKE_C_COMPILER_ID MATCHES "(Apple)?[Cc]lang")
    # Clang C compiler
    set(${PRJ_PREFIX}_C_CLANG TRUE)
    include(cmake/compiler/clang_c.cmake)
elseif(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
    # MSVC C config included with C++ below
    set(${PRJ_PREFIX}_C_MSVC TRUE)
else()
    message(FATAL_ERROR "Configuration script required for ${CMAKE_C_COMPILER_ID} C compiler.")
endif()

# Include current C++ compiler configuration script
if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    # GCC C++ compiler
    set(${PRJ_PREFIX}_CXX_GCC TRUE)
    include(cmake/compiler/gcc_cxx.cmake)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "(Apple)?[Cc]lang")
    # Clang C++ compiler
    set(${PRJ_PREFIX}_CXX_CLANG TRUE)
    include(cmake/compiler/clang_cxx.cmake)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    # Microsoft Visual C/C++ compiler
    set(${PRJ_PREFIX}_CXX_MSVC TRUE)
    include(cmake/compiler/msvc_ccxx.cmake)
else()
    message(FATAL_ERROR "Configuration script required for ${CMAKE_CXX_COMPILER_ID} C++ compiler.")
endif()
