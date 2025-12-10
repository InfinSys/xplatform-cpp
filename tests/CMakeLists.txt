
#==================================
#     /tests Directory Script
#==================================

if(${PRJ_PREFIX}_CLI_DEBUG)
    add_subdirectory(cli)
endif()

if(${PRJ_PREFIX}_UNIT_TEST)
    add_subdirectory(unit)
endif()

if(${PRJ_PREFIX}_BENCHMARK)
    add_subdirectory(benchmark)
endif()
