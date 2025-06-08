
#======================================
#     /tests/cli Directory Script
#======================================

add_executable(
    dev_cli_debug
    "${CMAKE_CURRENT_SOURCE_DIR}/dev_exe.cpp"
)

target_compile_features(
    dev_cli_debug

    PUBLIC
    cxx_std_20
)

#target_link_libraries(
#    host_cli_debug
#
#    PRIVATE
#    [Source targets]
#)
