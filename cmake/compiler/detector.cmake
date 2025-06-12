
#====================================
#     PROJECT COMPILER DETECTOR
#====================================

# Include native compiler configuration scripts
if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    # GNU C++ compiler (g++)
    include(compiler/gnu_cxx)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "(Apple)?[Cc]lang")
    # LLVM C++ compiler (clang++)
    include(compiler/llvm_cxx)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC" OR CMAKE_C_COMPILER_ID STREQUAL "MSVC")
    # Microsoft Visual C/C++ compiler (cl.exe)
    include(compiler/msvc_ccxx)
else()
    message(FATAL_ERROR "Configuration script required for ${CMAKE_CXX_COMPILER_ID} C++ compiler.")
endif()

if(CMAKE_C_COMPILER_ID STREQUAL "GNU")
    # GNU C compiler (gcc)
    include(compiler/gnu_c)
elseif(CMAKE_C_COMPILER_ID MATCHES "(Apple)?[Cc]lang")
    # LLVM C compiler (clang)
    include(compiler/llvm_c)
elseif(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
    # Directory was already added; prevents error trigger
else()
    message(FATAL_ERROR "Configuration script required for ${CMAKE_C_COMPILER_ID} C compiler.")
endif()
