
#=======================================
#     /tests/host Directory Script
#=======================================

if(CLI_DEBUGGING)
    add_subdirectory(cli)
endif()

if(UNIT_TESTING)
    add_subdirectory(unit)
endif()

if(BENCHMARKING)
    add_subdirectory(benchmark)
endif()
