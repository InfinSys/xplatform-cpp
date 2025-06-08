
#======================================
#     /tests/cli Directory Script
#======================================

add_executable(
    host_cli_debug
    "${CMAKE_CURRENT_SOURCE_DIR}/dev_exe.cpp"
)

target_compile_features(
    host_cli_debug

    PUBLIC
    cxx_std_20
)

#target_link_libraries(
#    host_cli_debug
#
#    PRIVATE
#    <N/A>
#)
