
#======================================
#     /tests/cli Directory Script
#======================================

# Create developer command line executable
add_executable(dev_cli_debug "dev_exe.cpp")

# Conditionally link against compiler configuration
if(${${PRJ_PREFIX}_CXX_GCC})
    target_link_libraries(
        dev_cli_debug
    
        PRIVATE
          ${PRJ_PREFIX_L}_gcc_cxx_bundle
          ${PRJ_PREFIX_L}_gcc_c_defines
    )
elseif(${${PRJ_PREFIX}_CXX_CLANG})
    target_link_libraries(
        dev_cli_debug
    
        PRIVATE
          ${PRJ_PREFIX_L}_clang_cxx_bundle
          ${PRJ_PREFIX_L}_clang_c_defines
    )
elseif(${${PRJ_PREFIX}_CXX_MSVC})
    target_link_libraries(
        dev_cli_debug
    
        PRIVATE
          ${PRJ_PREFIX_L}_msvc_cxx_bundle
    )
endif()
