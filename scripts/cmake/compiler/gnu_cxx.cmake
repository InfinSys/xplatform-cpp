
#===============================================
#     GNU C++ COMPILER CONFIGURATION (g++)
#===============================================

# TODO: Setup g++ compiler configuration (if applicable)

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

add_library(GLOBAL_CXX_OPTIONS INTERFACE)

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
