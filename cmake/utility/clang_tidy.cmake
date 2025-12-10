
#==========================================
#     CLANG-TIDY UTILITY TARGET SETUP
#==========================================

# TODO: Configure clang-tidy utility target...

set(
    RECURSIVE_HEADER_SEARCH_DIRS

    "${CMAKE_SOURCE_DIR}/include/*.h"
    "${CMAKE_SOURCE_DIR}/include/*.hpp"
    "${CMAKE_SOURCE_DIR}/lib/*.h"
    "${CMAKE_SOURCE_DIR}/lib/*.hpp"
)

set(
    RECURSIVE_SOURCE_SEARCH_DIRS

    "${CMAKE_SOURCE_DIR}/src/*.c"
    "${CMAKE_SOURCE_DIR}/src/*.cpp"
    "${CMAKE_SOURCE_DIR}/lib/*.c"
    "${CMAKE_SOURCE_DIR}/lib/*.cpp"
)

# Clang-Tidy config file path
set(CLANG_TIDY_CONFIG "${CMAKE_SOURCE_DIR}/.clang-tidy")

# Check if config file exists
if(NOT EXISTS "${CLANG_TIDY_CONFIG}")
    message(
        FATAL_ERROR
        "\nNo clang-tidy configuration "
        "located at: ${CLANG_TIDY_CONFIG}\n"
    )
endif()

# set(
#     CMAKE_CXX_CLANG_TIDY
# 
#     "${CLANG_TIDY_EXECUTABLE}"
#     "-config-file=${CLANG_TIDY_CONFIG}"
#     "-p=${CMAKE_BINARY_DIR}"
# )

# Collect all source files
file(
    GLOB_RECURSE ALL_SOURCE_FILES
    ${RECURSIVE_SOURCE_SEARCH_DIRS}
)

# Collect all header files
file(
    GLOB_RECURSE ALL_HEADER_FILES
    ${RECURSIVE_HEADER_SEARCH_DIRS}
)

add_custom_target(
    ${PRJ_PREFIX}_clang_tidy

    COMMAND
        ${CLANG_TIDY_EXECUTABLE}
        ${ALL_SOURCE_FILES}
        ${ALL_HEADER_FILES}
        -p ${CMAKE_BINARY_DIR}
        "--config-file=${CLANG_TIDY_CONFIG}"
        "-system-headers=false"
    
    COMMENT "Running Clang-Tidy on source files..."
    VERBATIM
)
