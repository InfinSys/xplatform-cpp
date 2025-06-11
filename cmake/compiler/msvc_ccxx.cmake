
#=================================================================
#     MICROSOFT VISUAL C/C++ COMPILER CONFIGURATION (cl.exe)
#=================================================================

# TODO: Setup msvc compiler configuration (if applicable)

set(
    CXX_COMPILE_FLAGS
    ""
)

set(
    CXX_WARNING_FLAGS
    ""
)

set(
    CXX_PP_DEFINITIONS
    ""
)

set(
    C_COMPILE_FLAGS
    ""
)

set(
    C_WARNING_FLAGS
    ""
)

set(
    C_PP_DEFINITIONS
    ""
)

add_library(GLOBAL_CXX_OPTIONS INTERFACE)
add_library(GLOBAL_C_OPTIONS INTERFACE)

target_compile_options(
    GLOBAL_CXX_OPTIONS

    INTERFACE
    ${CXX_COMPILE_FLAGS}
    ${CXX_WARNING_FLAGS}
)

target_compile_definitions(
    GLOBAL_CXX_OPTIONS

    INTERFACE
    ${CXX_PP_DEFINITIONS}
)

target_compile_options(
    GLOBAL_C_OPTIONS

    INTERFACE
    ${C_COMPILE_FLAGS}
    ${C_WARNING_FLAGS}
)

target_compile_definitions(
    GLOBAL_C_OPTIONS

    INTERFACE
    ${C_PP_DEFINITIONS}
)
