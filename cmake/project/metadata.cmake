
#==================================
#     PROJECT METADATA MODULE
#==================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/project/metadata.cmake
#
# @note
# This module generates files during CMake configuration.
#
# @details
# Defines the project's identity through a set of descriptive metadata
# fields that drive the generation of both source and non-source files
# from those definitions.
#
# @author Jamon T. Bailey
# @date 06-07-2025
# --------------------------------------------------------------------

# Include helper macros
include("${${PRJ_PREFIX}_CMAKE_MODULES_DIR}/utility/metadata_utils.cmake")

# Track temporary code generation variables
create_${PRJ_PREFIX_L}_temporary_cache_list()

# --------------------------------------------------------------------
# Software Metadata
#

# TODO: Personalize software metadata for code generation
# Note: These create persistent cache variables (prefix is auto handled)
# (i.e. 'UUID' becomes referencable by '${PRJ_PREFIX}_UUID')
set_${PRJ_PREFIX_L}_metadata(PUBLISHER        "<Publisher/Creator>" DESCRIPTION "Product publisher")
set_${PRJ_PREFIX_L}_metadata(PRODUCT_TYPE     "<Executable, Library, or Firmware>" DESCRIPTION "Software type")
set_${PRJ_PREFIX_L}_metadata(INTERFACE_TYPE   "<GUI, CLI, or API>" DESCRIPTION "Product interface")
set_${PRJ_PREFIX_L}_metadata(UUID             "<Unique identifier>" DESCRIPTION "Product unique identifier")
set_${PRJ_PREFIX_L}_metadata(LICENSE_TYPE     "<MIT, GPLv3, Proprietary, etc.>" DESCRIPTION "Product license type")
set_${PRJ_PREFIX_L}_metadata(FULL_NAME        "<Software name>" DESCRIPTION "Product name")
set_${PRJ_PREFIX_L}_metadata(SHORT_NAME       "<Shortend software name>" DESCRIPTION "Product short name")
set_${PRJ_PREFIX_L}_metadata(MAIN_BINARY_NAME "demo" DESCRIPTION "Main binary")
set_${PRJ_PREFIX_L}_metadata(META_NAMESPACE   "${PRJ_PREFIX}" DESCRIPTION "Project metadata namespace prefix")

# Create temporary cache variables for code generation
# Note: These create temporary cache variables (prefix is auto handled)
# (i.e. 'SFTW_TYPE' becomes referencable by 'RESOLVED_SFTW_TYPE' in templates)
create_${PRJ_PREFIX_L}_template_reference(SFTW_PUBLISHER    PUBLISHER)
create_${PRJ_PREFIX_L}_template_reference(SFTW_TYPE         PRODUCT_TYPE)
create_${PRJ_PREFIX_L}_template_reference(SFTW_INTERFACE    INTERFACE_TYPE)
create_${PRJ_PREFIX_L}_template_reference(SFTW_UUID         UUID)
create_${PRJ_PREFIX_L}_template_reference(SFTW_LICENSE_TYPE LICENSE_TYPE)
create_${PRJ_PREFIX_L}_template_reference(SFTW_NAME         FULL_NAME)
create_${PRJ_PREFIX_L}_template_reference(SFTW_SHORT_NAME   SHORT_NAME)
create_${PRJ_PREFIX_L}_template_reference(SFTW_MAIN_BINARY  MAIN_BINARY_NAME)
create_${PRJ_PREFIX_L}_template_reference(SFTW_META_PREFIX  META_NAMESPACE)

# --------------------------------------------------------------------
# File Generation
#

configure_${PRJ_PREFIX_L}_template(
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/templ/README.md.in"
    "${${PRJ_PREFIX}_SOURCE_DIR}/README.md"
)

configure_${PRJ_PREFIX_L}_template(
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/templ/Doxyfile.in"
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/Doxyfile"
)

configure_${PRJ_PREFIX_L}_template(
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/templ/index.html.in"
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/ref/index.html"
)

configure_${PRJ_PREFIX_L}_template(
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/templ/inaug.md.in"
    "${${PRJ_PREFIX}_SOURCE_DIR}/docs/prj/inaug.md"
)

configure_${PRJ_PREFIX_L}_template(
    "${${PRJ_PREFIX}_SOURCE_DIR}/lib/${PRJ_PREFIX_L}_metadata/templ/info.h.in"
    "${${PRJ_PREFIX}_SOURCE_DIR}/lib/${PRJ_PREFIX_L}_metadata/info.h"
)

configure_${PRJ_PREFIX_L}_template(
    "${${PRJ_PREFIX}_SOURCE_DIR}/lib/${PRJ_PREFIX_L}_metadata/templ/version.h.in"
    "${${PRJ_PREFIX}_SOURCE_DIR}/lib/${PRJ_PREFIX_L}_metadata/version.h"
)

# --------------------------------------------------------------------
# Scope Cleanup
#

remove_${PRJ_PREFIX_L}_temporary_cache_list()
