
#============================================
#     /lib/src/demolib Directory Script
#============================================

# Project metadata
add_library(demolib STATIC)

target_sources(
    demolib

    PUBLIC
      "${CMAKE_CURRENT_SOURCE_DIR}/calculator.cpp"
)

target_include_directories(
    demolib

    PUBLIC
      "${${PRJ_PREFIX}_SOURCE_DIR}/lib/include"
)
