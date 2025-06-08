
#=======================================
#     /tests/unit Directory Script
#=======================================

add_library(googletest_external INTERFACE)

target_include_directories(
	googletest_external

	INTERFACE
	"${googletest_SOURCE_DIR}/googletest/include"
)

target_link_libraries(
	googletest_external

	INTERFACE
	gtest
	gtest_main
)

# Unit-testing Source
# TODO: Add unit-testing source dirs...
