
#================================
#     /src Directory Script
#================================

# TODO: Handle project source targets...

add_executable(${${PRJ_PREFIX}_MAIN_BINARY_NAME})

target_sources(
    ${${PRJ_PREFIX}_MAIN_BINARY_NAME}

    PRIVATE
      "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp"
)

target_link_libraries(
    ${${PRJ_PREFIX}_MAIN_BINARY_NAME}

    PRIVATE
      demolib
)

target_include_directories(
    ${${PRJ_PREFIX}_MAIN_BINARY_NAME}

    PRIVATE
      "${${PRJ_PREFIX}_SOURCE_DIR}/include"
      "${${PRJ_PREFIX}_SOURCE_DIR}/lib/include"
)

# Conditionally link against compiler configuration
if(${${PRJ_PREFIX}_CXX_GCC})
    target_link_libraries(
        ${${PRJ_PREFIX}_MAIN_BINARY_NAME}
    
        PRIVATE
          ${PRJ_PREFIX_L}_gcc_cxx_bundle
          ${PRJ_PREFIX_L}_gcc_c_defines
    )
elseif(${${PRJ_PREFIX}_CXX_CLANG})
    target_link_libraries(
        ${${PRJ_PREFIX}_MAIN_BINARY_NAME}
    
        PRIVATE
          ${PRJ_PREFIX_L}_clang_cxx_bundle
          ${PRJ_PREFIX_L}_clang_c_defines
    )
elseif(${${PRJ_PREFIX}_CXX_MSVC})
    target_link_libraries(
        ${${PRJ_PREFIX}_MAIN_BINARY_NAME}
    
        PRIVATE
          ${PRJ_PREFIX_L}_msvc_cxx_bundle
    )
endif()
