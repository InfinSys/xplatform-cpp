
#==================================
#     PROJECT METADATA MODULE
#==================================

set(${PRJ_SCOPE}_PUBLISHER "<Publisher/Creator>" CACHE STRING "Product publisher" FORCE)
set(${PRJ_SCOPE}_PRODUCT_TYPE "<Executable or Library>" CACHE STRING "Product type" FORCE)
set(${PRJ_SCOPE}_INTERFACE_TYPE "<API, CLI, or GUI>" CACHE STRING "Product interface" FORCE)
set(${PRJ_SCOPE}_UUID "<Unique identifier>" CACHE STRING "Product unique identifier" FORCE)
set(${PRJ_SCOPE}_LICENSE_TYPE "<MIT, GPLv3, etc.>" CACHE STRING "Product license type" FORCE)
set(${PRJ_SCOPE}_FULL_NAME "<Name>" CACHE STRING "Product name" FORCE)
set(${PRJ_SCOPE}_SHORT_NAME "<Short name>" CACHE STRING "Product short name" FORCE)
set(${PRJ_SCOPE}_MAIN_BINARY_NAME "<Main binary name>" CACHE STRING "Main binary" FORCE)
set(${PRJ_SCOPE}_META_PREFIX "${LOCAL_PROJECT_SCOPE}" CACHE STRING "Project metadata prefix" FORCE)

if(WIN32)
	set(${PRJ_SCOPE}_COMPILE_PLATFORM 0 CACHE STRING "Binary compiled on Windows platform" FORCE)
elseif(APPLE)
	set(${PRJ_SCOPE}_COMPILE_PLATFORM 2 CACHE STRING "Binary compiled on macOS platform" FORCE)
elseif(UNIX)
	set(${PRJ_SCOPE}_COMPILE_PLATFORM 1 CACHE STRING "Binary compiled on Linux platform" FORCE)
else()
	set(${PRJ_SCOPE}_COMPILE_PLATFORM -1 CACHE STRING "Binary compiled on unknown platform" FORCE)
endif()

# Temporarily cached variables
set(RESOLVED_SFTW_PUBLISHER "${${PRJ_SCOPE}_PUBLISHER}" CACHE STRING "Temporary" FORCE)
set(RESOLVED_SFTW_TYPE "${${PRJ_SCOPE}_PRODUCT_TYPE}" CACHE STRING "Temporary" FORCE)
set(RESOLVED_SFTW_INTERFACE "${${PRJ_SCOPE}_INTERFACE_TYPE}" CACHE STRING "Temporary" FORCE)
set(RESOLVED_SFTW_UUID "${${PRJ_SCOPE}_UUID}" CACHE STRING "Temporary" FORCE)
set(RESOLVED_SFTW_LICENSE_TYPE "${${PRJ_SCOPE}_LICENSE_TYPE}" CACHE STRING "Temporary" FORCE)
set(RESOLVED_SFTW_NAME "${${PRJ_SCOPE}_FULL_NAME}" CACHE STRING "Temporary" FORCE)
set(RESOLVED_SFTW_SHORT_NAME "${${PRJ_SCOPE}_SHORT_NAME}" CACHE STRING "Temporary" FORCE)
set(RESOLVED_SFTW_MAIN_BINARY "${${PRJ_SCOPE}_MAIN_BINARY_NAME}" CACHE STRING "Temporary" FORCE)
set(RESOLVED_SFTW_META_PREFIX "${${PRJ_SCOPE}_META_PREFIX}" CACHE STRING "Temporary" FORCE)
set(RESOLVED_SFTW_COMPILE_PLATFORM "${${PRJ_SCOPE}_COMPILE_PLATFORM}" CACHE STRING "Temporary" FORCE)

set(
	TEMP_CACHE_VARS

	RESOLVED_SFTW_PUBLISHER
	RESOLVED_SFTW_TYPE
	RESOLVED_SFTW_INTERFACE
	RESOLVED_SFTW_UUID
	RESOLVED_SFTW_LICENSE_TYPE
	RESOLVED_SFTW_NAME
	RESOLVED_SFTW_SHORT_NAME
	RESOLVED_SFTW_MAIN_BINARY
	RESOLVED_SFTW_META_PREFIX
	RESOLVED_SFTW_COMPILE_PLATFORM
)

configure_file(
	"${CMAKE_SOURCE_DIR}/docs/templ/LICENSE.in"
	"${CMAKE_SOURCE_DIR}/LICENSE"
	@ONLY
)

configure_file(
	"${CMAKE_SOURCE_DIR}/docs/templ/README.md.in"
	"${CMAKE_SOURCE_DIR}/README.md"
	@ONLY
)

configure_file(
	"${CMAKE_SOURCE_DIR}/docs/templ/Doxyfile.in"
	"${CMAKE_SOURCE_DIR}/docs/Doxyfile"
	@ONLY
)

configure_file(
	"${CMAKE_SOURCE_DIR}/docs/templ/index.html.in"
	"${CMAKE_SOURCE_DIR}/docs/ref/index.html"
	@ONLY
)

configure_file(
	"${CMAKE_SOURCE_DIR}/docs/templ/inaug.md.in"
	"${CMAKE_SOURCE_DIR}/docs/prj/inaug.md"
	@ONLY
)

# Remove temporary cache variables
foreach(TEMPVAR ${TEMP_CACHE_VARS})
	unset(${TEMPVAR} CACHE)
endforeach()



#configure_file(
#	"${CMAKE_SOURCE_DIR}/include/meta/templ/version.h.in"
#	"${CMAKE_SOURCE_DIR}/include/meta/version.h"
#	@ONLY
#)
#
#configure_file(
#	"${CMAKE_SOURCE_DIR}/include/meta/templ/info.h.in"
#	"${CMAKE_SOURCE_DIR}/include/meta/info.h"
#	@ONLY
#)
