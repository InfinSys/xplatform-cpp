
#======================================
#     /tests/cli Directory Script
#======================================

# Create developer command line executable
add_executable(dev_cli_debug "dev_exe.cpp")

if(${${PRJ_PREFIX}_CXX_GCC})
    target_link_libraries(
        dev_cli_debug
    
        PRIVATE
        ${PRJ_PREFIX}_gcc_cxx_bundle
    )
# elseif(${${PRJ_PREFIX}_CXX_CLANG})
elseif(${${PRJ_PREFIX}_CXX_MSVC})
    target_link_libraries(
        dev_cli_debug
    
        PRIVATE
        ${PRJ_PREFIX}_msvc_cxx_bundle
    )
endif()

# Setup installation of developer executable
install(
    TARGETS dev_cli_debug
    COMPONENT DevDebugApp
    EXPORT dev_cli_debug-targets

    RUNTIME
        DESTINATION ${CMAKE_INSTALL_BINDIR}
)
