
#==================================
#     PROJECT METADATA MODULE
#==================================

include(utility/metadata_tools)

set(TEMP_CACHE_VARS "")

# TODO: Personalize software metadata...
set_metadata(PUBLISHER "<Publisher/Creator>" DESCRIPTION "Product publisher")
set_metadata(PRODUCT_TYPE "<Executable, Library, or Firmware>" DESCRIPTION "Software type")
set_metadata(INTERFACE_TYPE "<GUI, CLI, API, or HSI>" DESCRIPTION "Product interface")
set_metadata(UUID "<Unique identifier>" DESCRIPTION "Product unique identifier")
set_metadata(LICENSE_TYPE "<MIT, GPLv3, Proprietary, etc.>" DESCRIPTION "Product license type")
set_metadata(FULL_NAME "<Software name>" DESCRIPTION "Product name")
set_metadata(SHORT_NAME "<Software shorter name>" DESCRIPTION "Product short name")
set_metadata(MAIN_BINARY_NAME "demo" DESCRIPTION "Main binary")
set_metadata(META_PREFIX "${PRJ_SCOPE}" DESCRIPTION "Project metadata prefix")

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
    "${CMAKE_SOURCE_DIR}/lib/metadata/templ/info.h.in"
    "${CMAKE_SOURCE_DIR}/lib/metadata/info.h"
)

configure_template(
    "${CMAKE_SOURCE_DIR}/lib/metadata/templ/version.h.in"
    "${CMAKE_SOURCE_DIR}/lib/metadata/version.h"
)

clear_temporary_cache()
