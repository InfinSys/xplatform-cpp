
#=============================================
#     PROJECT DEPENDENCY HANDLING MODULE
#=============================================

include_guard(GLOBAL)

# --------------------------------------------------------------------
# @file
# cmake/project/dependencies.cmake
#
# @note
# Intended to be included from the root `CMakeLists.txt` script,
# early enough for other scripts that depend on these targets being
# defined.
#
# @details
# Centralizes third-party dependency management behind a modular
# macro-based interface where each dependency is encapsulated in
# its own dedicated setup macro and collectively orchestrated through
# a single top-level call.
#
# @author Jamon T. Bailey
# @date 01-13-2026
# --------------------------------------------------------------------

# Setup all third-party project dependencies
macro(setup_${PRJ_PREFIX_L}_dependencies)
    # TODO: Call individual dependency setup macros here...
    #
    # Example:
    # setup_${PRJ_PREFIX_L}_wxwidgets()
    # Call others defined below...
endmacro()

# TODO: Implement individual dependency setup macros...
#
# Naming Convention:
#     macro(setup_${PRJ_PREFIX_L}_<DEPENDENCY_NAME>)
#
# Implementation Example:
# macro(setup_${PRJ_PREFIX_L}_wxwidgets)
#     # Check if we are using wxWidgets (optional)
#     if(${PRJ_PREFIX}_WX)
#         # Fetch wxWidgets library source
#         add_subdirectory(3rdparty/wxWidgets)
# 
#         # wxWidgets library target
#         add_library(wxwidgets_external INTERFACE)
#
#         target_link_libraries(
#             wxwidgets_external
# 
#             INTERFACE
#               wxbase
#               wxcore
#               wxwebview
#         )
#     endif()
# endmacro()
