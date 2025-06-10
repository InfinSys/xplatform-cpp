
#================================
#     /src Directory Script
#================================

include(compiler/detector)
include(linker/config)

include(project_tools)

set(MAIN_BINARY_NAME "${${PRJ_SCOPE}_MAIN_BINARY_NAME}")

# TODO: Handle source targets...

# Example: primary target
add_library(${MAIN_BINARY_NAME} STATIC)

# Example: include directories
target_include_directories(
    ${MAIN_BINARY_NAME}

    PUBLIC
    ${PRJ_INCLUDE_DIRS}
)

# Example: project-wide C++ standard
set_cxx_standard(GLOBAL_CXX_OPTIONS INTERFACE ${PRJ_CXX_STANDARD})

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
