
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

# Cache a temporary simplified variable for use in file configuration
macro(create_template_reference REF_NAME REF_KEY)
	if(REF_NAME STREQUAL "")
		message(ERROR "No reference name provided for '${${PRJ_SCOPE}_${REF_KEY}}' value")
	endif()
	
	set(RESOLVED_${REF_NAME} ${${PRJ_SCOPE}_${REF_KEY}} CACHE STRING "Temporary" FORCE)
	list(APPEND TEMP_CACHE_VARS RESOLVED_${REF_NAME})
endmacro()

# TODO: Personalize software metadata...
set_metadata(PUBLISHER "<Publisher/Creator>" DESCRIPTION "Product publisher")
set_metadata(PRODUCT_TYPE "<Executable, Library, or Firmware>" DESCRIPTION "Software type")
set_metadata(INTERFACE_TYPE "<GUI, CLI, API, or HSI>" DESCRIPTION "Product interface")
set_metadata(UUID "<Unique identifier>" DESCRIPTION "Product unique identifier")
set_metadata(LICENSE_TYPE "<MIT, GPLv3, Proprietary, etc.>" DESCRIPTION "Product license type")
set_metadata(FULL_NAME "<Software name>" DESCRIPTION "Product name")
set_metadata(SHORT_NAME "<Software shorter name>" DESCRIPTION "Product short name")
set_metadata(MAIN_BINARY_NAME "<Main binary name>" DESCRIPTION "Main binary")
set_metadata(META_PREFIX "${PRJ_SCOPE}" DESCRIPTION "Project metadata prefix")

set(TEMP_CACHE_VARS "")

# Temporarily cached variables for code generation
create_template_reference(SFTW_PUBLISHER    PUBLISHER)
create_template_reference(SFTW_TYPE         PRODUCT_TYPE)
create_template_reference(SFTW_INTERFACE    INTERFACE_TYPE)
create_template_reference(SFTW_UUID         UUID)
create_template_reference(SFTW_LICENSE_TYPE LICENSE_TYPE)
create_template_reference(SFTW_NAME         FULL_NAME)
create_template_reference(SFTW_SHORT_NAME   SHORT_NAME)
create_template_reference(SFTW_MAIN_BINARY  MAIN_BINARY_NAME)
create_template_reference(SFTW_META_PREFIX  META_PREFIX)

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
