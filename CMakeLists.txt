
#====================================================
#
#     Cross Platform C++/CMake Project Template
#     (Root CMakeLists.txt Script)
#
#====================================================

# Confirm this is top-level project
if (CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    # Setup CMake project
    cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

    project(
        Project_Name_Here
        VERSION 0.0.0.0
        LANGUAGES
            C CXX ASM
    )

    # TODO: Find all references to the below `${PRJ_PREFIX}`
    # variable and replace it with the expanded literal,
    # especially if you intend to use this project as a
    # dependency for other projects. Then delete it, you
    # should not keep the `PRJ_PREFIX` variable around.
    set(PRJ_PREFIX "XPTEMP")

    # Export compilation commands to build dir
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

    # Include root CML helper module
    include(cmake/utility/root_setup.cmake)
    setup_testing_dependencies()
    setup_clang_format_target()
    setup_clang_tidy_target()

    # Include compiler configuration script
    include(cmake/compiler/config_dispatch.cmake)
endif()

set(${PRJ_PREFIX}_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(${PRJ_PREFIX}_CMAKE_MODULES_DIR "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Include native install directory variables
include(GNUInstallDirs)

# Source Subdirs
add_subdirectory(lib)
add_subdirectory(src)
# TODO: Add other project source directories...

# Confirm this is top-level project
if (${CMAKE_PROJECT_NAME}_IS_TOP_LEVEL)
    # Testing sources
    add_subdirectory(tests)
endif()
