
#================================
#     /src Directory Script
#================================

# TODO: Handle project source targets...

add_executable(Demo_Executable)

target_sources(
    Demo_Executable

    PRIVATE
        "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp"
)

target_include_directories(
    Demo_Executable

    PRIVATE
    "${${PRJ_PREFIX}_SOURCE_DIR}/include"
)

# Conditionally link against compiler configuration
if(${${PRJ_PREFIX}_CXX_GCC})
    target_link_libraries(
        Demo_Executable
    
        PRIVATE
        ${PRJ_PREFIX}_gcc_cxx_bundle
        ${PRJ_PREFIX}_gcc_c_defines
    )
elseif(${${PRJ_PREFIX}_CXX_CLANG})
    target_link_libraries(
        Demo_Executable
    
        PRIVATE
        ${PRJ_PREFIX}_clang_cxx_bundle
        ${PRJ_PREFIX}_clang_c_defines
    )
elseif(${${PRJ_PREFIX}_CXX_MSVC})
    target_link_libraries(
        Demo_Executable
    
        PRIVATE
        ${PRJ_PREFIX}_msvc_cxx_bundle
    )
endif()

# Setup installation of demo executable
install(
    TARGETS Demo_Executable
    COMPONENT DemoApp
    EXPORT Demo_Executable-targets

    RUNTIME
        DESTINATION ${CMAKE_INSTALL_BINDIR}
)
