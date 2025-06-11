
#====================================================
#     CODEBASE FORMATTING MODULE (Clang-Format)
#====================================================

# Search directories recursively for formattable source files
macro(format_source_code)
    # TODO: Configure which directories clang-format visits recursively...
    set(
        FORMAT_SEARCH_DIRS
        "${CMAKE_SOURCE_DIR}/lib"
        "${CMAKE_SOURCE_DIR}/include"
        "${CMAKE_SOURCE_DIR}/src"
        "${CMAKE_SOURCE_DIR}/tests"
    )

    set(
        SOURCE_EXTENSIONS
        *.c
        *.cpp
        *.h
        *.hpp
    )

    set(SOURCE_FILE_LIST "")

    foreach(DIR ${FORMAT_SEARCH_DIRS})
        foreach(EXTENSION ${SOURCE_EXTENSIONS})
            file(
                GLOB_RECURSE
                tmp_files

                CONFIGURE_DEPENDS
                "${DIR}/${EXTENSION}"
            )
            list(APPEND SOURCE_FILE_LIST ${tmp_files})
        endforeach()
    endforeach()

    message(STATUS "Formatting source files...")

    add_custom_target(
        code_format

        COMMAND clang-format -i ${SOURCE_FILE_LIST}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        COMMENT "Formatting source files..."
    )
endmacro()
