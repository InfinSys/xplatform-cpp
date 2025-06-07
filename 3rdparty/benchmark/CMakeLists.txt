
#===============================================
#     /3rdparty/benchmark Directory Script
#===============================================

message(STATUS "Fetching Google Benchmark library source...")

include(FetchContent)
FetchContent_Declare(
	benchmark

	GIT_REPOSITORY
	https://github.com/google/benchmark.git

	GIT_TAG
	v1.9.4
)

FetchContent_MakeAvailable(benchmark)
