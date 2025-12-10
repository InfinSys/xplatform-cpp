
#============================================
#     CLANG-FORMAT UTILITY TARGET SETUP
#============================================

# TODO: Configure clang-format utility target...

# Directories to search recursively
set(
    RECURSIVE_SEARCH_DIRS

    "${CMAKE_SOURCE_DIR}/lib"
    "${CMAKE_SOURCE_DIR}/include"
    "${CMAKE_SOURCE_DIR}/src"
    "${CMAKE_SOURCE_DIR}/tests"
)

# File extensions to target
set(
    SOURCE_EXTENSIONS

    *.h
    *.c
    *.hpp
    *.cpp
)

# Resolved file paths to format
set(FORMAT_FILE_LIST "")

foreach(DIR ${RECURSIVE_SEARCH_DIRS})
    foreach(EXTENSION ${SOURCE_EXTENSIONS})
        # Glob all file paths within DIR ending with EXTENSION
        file(
            GLOB_RECURSE tmp_files

            CONFIGURE_DEPENDS
                "${DIR}/${EXTENSION}"
        )

        # Add globbed file paths to format list
        list(APPEND FORMAT_FILE_LIST ${tmp_files})
    endforeach()
endforeach()

# Create Clang-Format utility target
add_custom_target(
    ${PRJ_PREFIX}_clang_format

    COMMAND clang-format -i ${FORMAT_FILE_LIST}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Running Clang-Format on source files..."
    VERBATIM
)
