
#========================================================
#
#     Cross-Platform C/C++ & CMake Project Template
#     (Root CMakeLists.txt Script)
#
#========================================================

# Setup CMake project
cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

# Declare CMake project
project(
    Project_Name_Here
    VERSION 0.0.0
    LANGUAGES
      C CXX
)

# Include project CMake options
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/project/options.cmake)
# Include target platform characteristics
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/platform/detective.cmake)

# TODO:
# Find and replace all instances of:
#  - ${PRJ_PREFIX}
#  - ${PRJ_PREFIX_L}
# (exactly as is above)
#
# Replace these with your preferred project prefix (all-caps and
# lowercase). There are a lot of these so you should use search
# and replace for consistency. (215 + 150 = 365 to be exact)
#
# Delete the `PRJ_PREFIX` and `PRJ_PREFIX_L` variables defined
# below to avoid naming collisions. They are no longer necessary.
#
# Note that the build script will not work properly if you do not
# replace these placeholders first. Some placeholders are in non-
# build script files as well.
#
# You can't give the prefixes the same name or all hell will break
# loose.
set(PRJ_PREFIX "DEMO")
set(PRJ_PREFIX_L "demo")
# You can delete the above after you have successfully replaced the
# variable names with the intended prefix literals. You'll have an
# easier time interpreting the template after the above is complete.

# Confirm this is top-level project
if (${CMAKE_PROJECT_NAME}_IS_TOP_LEVEL)
    # Export compilation commands to build dir
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

    # Include root CML helper module
    include(cmake/utility/root_setup.cmake)
    setup_testing_dependencies()
    setup_clang_format_target()
    setup_clang_tidy_target()
endif()

set(${PRJ_PREFIX}_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(${PRJ_PREFIX}_CMAKE_MODULES_DIR "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Include native install directory variables
include(GNUInstallDirs)

# Include compiler configuration script
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/compiler/config_dispatch.cmake)
# Include project metadata module
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/project/metadata.cmake)

# Source Subdirs
add_subdirectory(lib)
add_subdirectory(src)
# TODO: Add other project source directories...

# Confirm this is top-level project
if (${CMAKE_PROJECT_NAME}_IS_TOP_LEVEL)
    # Testing sources
    add_subdirectory(tests)

    # Configure project build installation
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/project/install.cmake)
endif()
