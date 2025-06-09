
#================================================
#     /3rdparty/googletest Directory Script
#================================================

message(STATUS "Fetching GoogleTest library source...")

include(FetchContent)
FetchContent_Declare(
    googletest

    GIT_REPOSITORY
    https://github.com/google/googletest.git

    GIT_TAG
    v1.17.0
)

FetchContent_GetProperties(googletest)

set(googletest_BUILD_DIR "${FETCHCONTENT_BASE_DIR}/googletest-build" PARENT_SCOPE)
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(googletest)
