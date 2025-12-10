
#==============================================
#     PROJECT ROOT SETUP UTILITIES MODULE
#==============================================

# This script should be invoked from the root
# CMakeLists.txt file.

# Check for project testing flags and setup dependencies
macro(setup_testing_dependencies)
    if(${PRJ_PREFIX}_CLI_DEBUG)
        message(STATUS "${CMAKE_PROJECT_NAME} CLI debug build - enabled")
    endif()

    # Check for unit-testing flag
    if(${PRJ_PREFIX}_UNIT_TEST)
        # Fetch GoogleTest library source
        message(STATUS "${CMAKE_PROJECT_NAME} unit-test builds - enabled")
        add_subdirectory(3rdparty/googletest)
    endif()

    # Check for benchmarking flag
    if(${PRJ_PREFIX}_BENCHMARK)
        # Fetch Google Benchmark library source
        message(STATUS "${CMAKE_PROJECT_NAME} benchmark build - enabled")
        add_subdirectory(3rdparty/benchmark)
    endif()
endmacro()

# Check for codebase formatting flag and create utility target
macro(setup_clang_format_target)
    # Check for Clang-Format flag
    if(${PRJ_PREFIX}_CLANG_FORMAT)
        # Find existing Clang-Format installation
        find_program(CLANG_FORMAT_EXECUTABLE clang-format)

        if(NOT CLANG_FORMAT_EXECUTABLE)
            message(WARNING "clang-format not found: Cannot create source code format target.")
        else()
            # Create formatting utility target
            include(cmake/utility/clang_format.cmake)
        endif()
    endif()
endmacro()

# Check for codebase static analysis flag and create utility
macro(setup_clang_tidy_target)
    # Check for Clang-Tidy flag
    if(${PRJ_PREFIX}_CLANG_TIDY)
        # Find existing Clang-Tidy installation
        find_program(CLANG_TIDY_EXECUTABLE clang-tidy)

        if(NOT CLANG_TIDY_EXECUTABLE)
            message(WARNING "clang-tidy not found: Cannot create static analysis target.")
        else()
            # Create static analysis utility target
            include(cmake/utility/clang_tidy.cmake)
        endif()
    endif()
endmacro()
