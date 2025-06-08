
#==================================
#     PROJECT METADATA MODULE
#==================================

# Configure a templated file
macro(configure_template TEMPLATE_PATH DESTINATION_PATH)
    configure_file(
        ${TEMPLATE_PATH}
        ${DESTINATION_PATH}
        @ONLY
    )

    message(STATUS "Configured file: ${DESTINATION_PATH}")
endmacro()

# Cache project metadata
macro(set_metadata FIELD VALUE)
	set(options "")
	set(one_value_keywords DESCRIPTION)
	set(multi_value_keywords "")

	cmake_parse_arguments(
		ARGSS
		"${options}"
		"${one_value_keywords}"
		"${multi_value_keywords}"
		${ARGN}
	)

	if(ARGSS_DESCRIPTION STREQUAL "")
		set(ARGSS_DESCRIPTION "No description provided for '${FIELD}'")
	endif()

	set(${PRJ_SCOPE}_${FIELD} "${VALUE}" CACHE STRING "${ARGSS_DESCRIPTION}" FORCE)
endmacro()

# TODO: Personalize software metadata...
set_metadata(PUBLISHER "<Publisher/Creator>" DESCRIPTION "Product publisher")
set_metadata(PRODUCT_TYPE "<Executable or Library>" DESCRIPTION "Product publisher")
set_metadata(INTERFACE_TYPE "<API, CLI, or GUI>" DESCRIPTION "Product interface")
set_metadata(UUID "<Unique identifier>" DESCRIPTION "Product unique identifier")
set_metadata(LICENSE_TYPE "<MIT, GPLv3, Proprietary, etc.>" DESCRIPTION "Product license type")
set_metadata(FULL_NAME "<Name>" DESCRIPTION "Product name")
set_metadata(SHORT_NAME "<Short name>" DESCRIPTION "Product short name")
set_metadata(MAIN_BINARY_NAME "<Main binary name>" DESCRIPTION "Main binary")
set_metadata(META_PREFIX "${PRJ_SCOPE}" DESCRIPTION "Project metadata prefix")

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
)

configure_template(
	"${CMAKE_SOURCE_DIR}/docs/templ/LICENSE.in"
	"${CMAKE_SOURCE_DIR}/LICENSE"
)

configure_template(
	"${CMAKE_SOURCE_DIR}/docs/templ/README.md.in"
	"${CMAKE_SOURCE_DIR}/README.md"
)

configure_template(
	"${CMAKE_SOURCE_DIR}/docs/templ/Doxyfile.in"
	"${CMAKE_SOURCE_DIR}/docs/Doxyfile"
)

configure_template(
	"${CMAKE_SOURCE_DIR}/docs/templ/index.html.in"
	"${CMAKE_SOURCE_DIR}/docs/ref/index.html"
)

configure_template(
	"${CMAKE_SOURCE_DIR}/docs/templ/inaug.md.in"
	"${CMAKE_SOURCE_DIR}/docs/prj/inaug.md"
)

configure_template(
	"${CMAKE_SOURCE_DIR}/libs/metadata/templ/info.h.in"
	"${CMAKE_SOURCE_DIR}/libs/metadata/info.h"
)

configure_template(
	"${CMAKE_SOURCE_DIR}/libs/metadata/templ/version.h.in"
	"${CMAKE_SOURCE_DIR}/libs/metadata/version.h"
)

# Remove temporary cache variables
foreach(TEMPVAR ${TEMP_CACHE_VARS})
	unset(${TEMPVAR} CACHE)
endforeach()
