
#==========================================
#
#     X-Platform C++ Project Template
#     (Root CMakeLists.txt Script)
#
#==========================================

cmake_minimum_required(VERSION 3.6 FATAL_ERROR)

set(PRJ_NAME "XPlatformTemplate")
set(PRJ_SCOPE "XPTEMP")
set(PRJ_C_STANDARD 23)
set(PRJ_CXX_STANDARD 20)

project(
	${PRJ_NAME}
	VERSION 0.0.0.0
	LANGUAGES C CXX ASM
)

set(CMAKE_C_STANDARD ${PRJ_C_STANDARD})
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD ${PROJECT_CXX_STANDARD})
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")

set(
	PRJ_INCLUDE_DIRS
	"${CMAKE_SOURCE_DIR}/include"
	"${CMAKE_SOURCE_DIR}/libs"
)

# Do not modify the variables below
set(CLI_DEBUGGING OFF)
set(UNIT_TESTING OFF)
set(BENCHMARKING OFF)
# Do not modify the variables above

if(DEFINED CACHE{${PRJ_SCOPE}_CLI_DEBUG} AND ${PRJ_SCOPE}_CLI_DEBUG)
	message(STATUS "${PRJ_NAME} CLI debug build - enabled")
	set(CLI_DEBUGGING ON)
endif()

if(DEFINED CACHE{${PRJ_SCOPE}_UNIT_TEST} AND ${PRJ_SCOPE}_UNIT_TEST)
	message(STATUS "${PRJ_NAME} unit-test build - enabled")
	set(UNIT_TESTING ON)
	enable_testing()
	add_subdirectory(3rdparty/googletest)
endif()

if(DEFINED CACHE{${PRJ_SCOPE}_BENCHMARK} AND ${PRJ_SCOPE}_BENCHMARK)
	message(STATUS "${PRJ_NAME} benchmark build - enabled")
	set(BENCHMARKING ON)
	add_subdirectory(3rdparty/benchmark)
endif()

# Includes
include_directories(${PRJ_INCLUDE_DIRS})

# Sources
#add_subdirectory(libs)
#add_subdirectory(src)

# Testing
#add_subdirectory(tests)
