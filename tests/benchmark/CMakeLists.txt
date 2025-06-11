
#============================================
#     /tests/benchmark Directory Script
#============================================

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

# Benchmarking Source
# TODO: Add benchmarking source dirs...
