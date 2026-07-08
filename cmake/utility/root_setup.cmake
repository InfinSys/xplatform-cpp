
#==============================================
#     PROJECT ROOT SETUP UTILITIES MODULE
#==============================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/utility/root_setup.cmake
#
# @note
# Intended to be included from the root `CMakeLists.txt` script.
#
# The macros defined here are only meaningful in a top-level project
# context and should never be exposed when the project is consumed as
# a dependency.
#
# @details
# Provides a macro-based interface for top-level project setup
# concerns. Each macro encapsulates the configuration details of its
# respective concern to keep the root CMakeLists.txt script clear and
# expressive without all the noise.
#
# @author Jamon T. Bailey
# @date 10-04-2025
# --------------------------------------------------------------------

# Check for codebase formatting flag and create utility target
macro(setup_clang_format_target)
    # Check for Clang-Format flag
    if(${PRJ_PREFIX}_CLANG_FORMAT)
        # Create source formatting utility target
        include(cmake/tool/clang_format.cmake)
    endif()
endmacro()

# Check for codebase static analysis flag and create utility target
macro(setup_clang_tidy_target)
    # Check for Clang-Tidy flag
    if(${PRJ_PREFIX}_CLANG_TIDY)
        # Create static analysis utility target
        include(cmake/tool/clang_tidy.cmake)
    endif()
endmacro()

# Setup project testing dependencies
macro(setup_testing_dependencies)
    setup_googletest_dependency()
    setup_benchmark_dependency()
endmacro()

# Setup GoogleTest framework dependency and target
macro(setup_googletest_dependency)
    # Check for unit-testing flag
    if(${PRJ_PREFIX}_UNIT_TEST)
        # Fetch GoogleTest library source
        add_subdirectory(3rdparty/googletest)

        # GoogleTest library target
        add_library(googletest_external INTERFACE)

        target_include_directories(
            googletest_external

            INTERFACE
              "${googletest_SOURCE_DIR}/googletest/include"
        )

        target_link_libraries(
            googletest_external

            INTERFACE
              gtest
              gtest_main
        )
    endif()
endmacro()

# Setup GoogleTest Benchmark dependency and target
macro(setup_benchmark_dependency)
    # Check for benchmarking flag
    if(${PRJ_PREFIX}_BENCHMARK)
        # Fetch Google Benchmark library source
        add_subdirectory(3rdparty/benchmark)

        # Google Benchmark library target
        add_library(benchmark_external INTERFACE)

        target_include_directories(
            benchmark_external

            INTERFACE
              "${benchmark_SOURCE_DIR}/include"
        )

        target_link_libraries(
            benchmark_external

            INTERFACE
              benchmark
              benchmark_main
        )
    endif()
endmacro()
