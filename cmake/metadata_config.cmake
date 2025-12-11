
#==================================
#     PROJECT METADATA MODULE
#==================================

include("${${PRJ_PREFIX}_CMAKE_MODULES_DIR}/utility/metadata_tools.cmake")

create_temporary_cache_list()

# TODO: Personalize software metadata for code generation
set_metadata(PUBLISHER "<Publisher/Creator>" DESCRIPTION "Product publisher")
set_metadata(PRODUCT_TYPE "<Executable, Library, or Firmware>" DESCRIPTION "Software type")
set_metadata(INTERFACE_TYPE "<GUI, CLI, API, or HSI>" DESCRIPTION "Product interface")
set_metadata(UUID "<Unique identifier>" DESCRIPTION "Product unique identifier")
set_metadata(LICENSE_TYPE "<MIT, GPLv3, Proprietary, etc.>" DESCRIPTION "Product license type")
set_metadata(FULL_NAME "<Software name>" DESCRIPTION "Product name")
set_metadata(SHORT_NAME "<Shortend software name>" DESCRIPTION "Product short name")
set_metadata(MAIN_BINARY_NAME "demo" DESCRIPTION "Main binary")
set_metadata(META_NAMESPACE "${PRJ_PREFIX}" DESCRIPTION "Project metadata namespace")

# Temporarily cached variables for code generation
create_template_reference(SFTW_PUBLISHER    PUBLISHER)
create_template_reference(SFTW_TYPE         PRODUCT_TYPE)
create_template_reference(SFTW_INTERFACE    INTERFACE_TYPE)
create_template_reference(SFTW_UUID         UUID)
create_template_reference(SFTW_LICENSE_TYPE LICENSE_TYPE)
create_template_reference(SFTW_NAME         FULL_NAME)
create_template_reference(SFTW_SHORT_NAME   SHORT_NAME)
create_template_reference(SFTW_MAIN_BINARY  MAIN_BINARY_NAME)
create_template_reference(SFTW_META_PREFIX  META_NAMESPACE)

configure_template(
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/templ/README.md.in"
    "${${PRJ_PREFIX}_SOURCE_DIR}/README.md"
)

configure_template(
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/templ/Doxyfile.in"
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/Doxyfile"
)

configure_template(
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/templ/index.html.in"
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/ref/index.html"
)

configure_template(
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/templ/inaug.md.in"
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/prj/inaug.md"
)

configure_template(
    "${${PRJ_PREFIX}_SOURCE_DIR}/lib/xptemp_metadata/templ/info.h.in"
    "${${PRJ_PREFIX}_SOURCE_DIR}/lib/xptemp_metadata/info.h"
)

configure_template(
    "${${PRJ_PREFIX}_SOURCE_DIR}/lib/xptemp_metadata/templ/version.h.in"
    "${${PRJ_PREFIX}_SOURCE_DIR}/lib/xptemp_metadata/version.h"
)

clear_temporary_cache()
