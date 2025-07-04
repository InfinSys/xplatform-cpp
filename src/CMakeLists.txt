
#================================
#     /src Directory Script
#================================

include(utility/project_tools)

set(MAIN_BINARY_NAME "${${PRJ_SCOPE}_MAIN_BINARY_NAME}")

# TODO: Handle source targets...

# Example: primary target
set(ENTRY_POINT_SRC main.cpp)
add_executable(${MAIN_BINARY_NAME} ${ENTRY_POINT_SRC})

# Example: include directories
target_include_directories(
    ${MAIN_BINARY_NAME}

    PUBLIC
    ${PRJ_INCLUDE_DIRS}
)

# Example: project-wide C++ standard
use_project_cxx_standard(GLOBAL_CXX_OPTIONS INTERFACE)

target_link_options(
    GLOBAL_CXX_OPTIONS

    INTERFACE
    ${GLOBAL_LINK_FLAGS}
)

# Example: add 'main.cpp' to library
target_sources(
    ${MAIN_BINARY_NAME}

    PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp"
)

target_link_libraries(
    ${MAIN_BINARY_NAME}

    PUBLIC
    GLOBAL_CXX_OPTIONS
)
