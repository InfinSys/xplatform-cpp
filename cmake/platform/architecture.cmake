
#===============================================
#     TARGET ARCHITECTURE DETECTION MODULE
#===============================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/platform/architecture.cmake
#
# @note
# Intended to be included from the root `CMakeLists.txt` script,
# or through the `cmake/platform/detective.cmake` module, which
# consolidates all platform detection into a single include.
#
# @details
# Interrogates CMake's platform variables to detect and globally
# expose target architecture characteristic, covering architecture
# family, specific variant, pointer width, and byte order. These
# variables can then be used throughout the project's CMake scripts
# to drive platform-aware build decisions and conditionally enable
# architecture-specific behavior.
#
# @author Jamon T. Bailey
# @date 05-07-2026
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# Processor Architecture
#

string(TOLOWER "${CMAKE_SYSTEM_PROCESSOR}" _${PRJ_PREFIX}_arch_processor)

if(_${PRJ_PREFIX}_arch_processor MATCHES "^(amd64|x86_64|x64)$")
    # x86-64 Based Processor
    set(${PRJ_PREFIX}_ARCH_X86 ON CACHE INTERNAL "Target architecture family")
    set(${PRJ_PREFIX}_ARCH_X86_64 ON CACHE INTERNAL "Target architecture")
    set(${PRJ_PREFIX}_ARCH_NAME "x86_64" CACHE INTERNAL "Target architecture name")
    set(_${PRJ_PREFIX}_arch_expected_bits 64)
elseif(_${PRJ_PREFIX}_arch_processor MATCHES "^(i[3-6]86|x86)$")
    # x86 Based Processor
    set(${PRJ_PREFIX}_ARCH_X86 ON CACHE INTERNAL "Target architecture family")
    set(${PRJ_PREFIX}_ARCH_X86_32 ON CACHE INTERNAL "Target architecture")
    set(${PRJ_PREFIX}_ARCH_NAME "x86" CACHE INTERNAL "Target architecture name")
    set(_${PRJ_PREFIX}_arch_expected_bits 32)
elseif(_${PRJ_PREFIX}_arch_processor MATCHES "^(aarch64|arm64)$")
    # ARM64 Based Processor
    set(${PRJ_PREFIX}_ARCH_ARM ON CACHE INTERNAL "Target architecture family")
    set(${PRJ_PREFIX}_ARCH_ARM64 ON CACHE INTERNAL "Target architecture")
    set(${PRJ_PREFIX}_ARCH_NAME "arm64" CACHE INTERNAL "Target architecture name")
    set(_${PRJ_PREFIX}_arch_expected_bits 64)
elseif(_${PRJ_PREFIX}_arch_processor MATCHES "^(armv[5-8].*|arm)$")
    # ARM32 Based Processor
    set(${PRJ_PREFIX}_ARCH_ARM ON CACHE INTERNAL "Target architecture family")
    set(${PRJ_PREFIX}_ARCH_ARM32 ON CACHE INTERNAL "Target architecture")
    set(${PRJ_PREFIX}_ARCH_NAME "arm32" CACHE INTERNAL "Target architecture name")
    set(_${PRJ_PREFIX}_arch_expected_bits 32)
elseif(_${PRJ_PREFIX}_arch_processor MATCHES "^riscv64$")
    # RISC-V 64 Based Processor
    set(${PRJ_PREFIX}_ARCH_RISCV ON CACHE INTERNAL "Target architecture family")
    set(${PRJ_PREFIX}_ARCH_RISCV64 ON CACHE INTERNAL "Target architecture")
    set(${PRJ_PREFIX}_ARCH_NAME "riscv64" CACHE INTERNAL "Target architecture name")
    set(_${PRJ_PREFIX}_arch_expected_bits 64)
elseif(_${PRJ_PREFIX}_arch_processor MATCHES "^riscv32$")
    # RISC-V 32 Based Processor
    set(${PRJ_PREFIX}_ARCH_RISCV ON CACHE INTERNAL "Target architecture family")
    set(${PRJ_PREFIX}_ARCH_RISCV32 ON CACHE INTERNAL "Target architecture")
    set(${PRJ_PREFIX}_ARCH_NAME "riscv32" CACHE INTERNAL "Target architecture name")
    set(_${PRJ_PREFIX}_arch_expected_bits 32)
else()
    message(
        FATAL_ERROR
        "Unrecognized target architecture '${CMAKE_SYSTEM_PROCESSOR}'. "
        "Extend 'cmake/platform/architecture.cmake' with a matching "
        "handler.\n"
    )
endif()

# --------------------------------------------------------------------
# Processor Bitness
#

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(${PRJ_PREFIX}_ARCH_64BIT ON CACHE INTERNAL "64-bit architecture")
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set(${PRJ_PREFIX}_ARCH_32BIT ON CACHE INTERNAL "32-bit architecture")
else()
    message(
        FATAL_ERROR
        "Unsupported target pointer size. CMAKE_SIZEOF_VOID_P="
        "'${CMAKE_SIZEOF_VOID_P}', but ${CMAKE_PROJECT_NAME} only "
        "supports 32-bit (4-byte) and 64-bit (8-byte) platforms.\n"
    )
endif()

if(_${PRJ_PREFIX}_arch_expected_bits EQUAL 64 AND NOT ${PRJ_PREFIX}_ARCH_64BIT)
    message(
        FATAL_ERROR
        "Architecture/bitness mismatch. Detected '${${PRJ_PREFIX}_ARCH_NAME}' "
        "but CMAKE_SIZEOF_VOID_P reports a non-64-bit pointer size "
        "(detected ${CMAKE_SIZEOF_VOID_P}-byte pointer size).\n"
    )
elseif(_${PRJ_PREFIX}_arch_expected_bits EQUAL 32 AND NOT ${PRJ_PREFIX}_ARCH_32BIT)
    message(
        FATAL_ERROR
        "Architecture/bitness mismatch. Detected '${${PRJ_PREFIX}_ARCH_NAME}' "
        "but CMAKE_SIZEOF_VOID_P reports a non-32-bit pointer size "
        "(detected ${CMAKE_SIZEOF_VOID_P}-byte pointer size).\n"
    )
endif()

# --------------------------------------------------------------------
# Architecture Endianness
#

if(CMAKE_C_BYTE_ORDER)
    set(_${PRJ_PREFIX}_byte_order ${CMAKE_C_BYTE_ORDER})
elseif(CMAKE_CXX_BYTE_ORDER)
    set(_${PRJ_PREFIX}_byte_order ${CMAKE_CXX_BYTE_ORDER})
else()
    message(
        FATAL_ERROR
        "Unable to determine target platform byte order.\n"
    )
endif()

if(_${PRJ_PREFIX}_byte_order STREQUAL "LITTLE_ENDIAN")
    set(${PRJ_PREFIX}_ARCH_LITTLE_ENDIAN ON CACHE INTERNAL "Little-endian architecture")
elseif(_${PRJ_PREFIX}_byte_order STREQUAL "BIG_ENDIAN")
    set(${PRJ_PREFIX}_ARCH_BIG_ENDIAN ON CACHE INTERNAL "Big-endian architecture")
else()
    message(
        FATAL_ERROR
        "Unknown endianness detected: '${_${PRJ_PREFIX}_byte_order}'\n"
    )
endif()

# --------------------------------------------------------------------
# Scope Cleanup
#

unset(_${PRJ_PREFIX}_arch_processor)
unset(_${PRJ_PREFIX}_arch_expected_bits)
unset(_${PRJ_PREFIX}_byte_order)
