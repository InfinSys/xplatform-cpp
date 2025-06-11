
#======================================================
#     LLVM Clang C COMPILER CONFIGURATION (clang)
#======================================================

# TODO: Setup clang compiler configuration (if applicable)

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

add_library(GLOBAL_C_OPTIONS INTERFACE)

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
