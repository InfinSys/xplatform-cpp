
#======================================
#     PROJECT INSTALLATION MODULE
#======================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/project/install.cmake
#
# @note
# Intended to be included towards the end of the build script,
# generally after all project targets have been defined and made
# available.
#
# You must invoke the CMake install step to see the effects of this
# module. You can achieve this by running the following in the
# command line: `cmake --install --preset <CMAKE_PRESET_NAME>`.
#
# @details
# Defines installation rules that map the project's build artifacts
# to standard system directories. This resembles the project's file
# structure for distribution.
#
# @author Jamon T. Bailey
# @date 01-17-2026
# --------------------------------------------------------------------

# TODO: Setup distribution directory...

# Install main binary
install(
    TARGETS
      ${${PRJ_PREFIX}_MAIN_BINARY_NAME}

    COMPONENT ${PRJ_PREFIX}
      EXPORT ${${PRJ_PREFIX}_MAIN_BINARY_NAME}-targets

    RUNTIME
      DESTINATION ${CMAKE_INSTALL_BINDIR}

    LIBRARY
      DESTINATION ${CMAKE_INSTALL_LIBDIR}

    ARCHIVE
      DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
