
#====================================
#     GENERAL PROJECT UTILITIES
#====================================

# Set the C++ standard of a target
macro(set_cxx_standard TARGET PROPOGATION STANDARD_NUMBER)
    target_compile_features(
        ${TARGET}

        ${PROPOGATION}
        cxx_std_${STANDARD_NUMBER}
    )
endmacro()

# Set the C standard of a target
macro(set_c_standard TARGET PROPOGATION STANDARD_NUMBER)
    target_compile_features(
        ${TARGET}

        ${PROPOGATION}
        c_std_${STANDARD_NUMBER}
    )
endmacro()

# Apply the project specified C++ standard to a target
macro(use_project_cxx_standard TARGET PROPOGATION)
    target_compile_features(
        ${TARGET}

        ${PROPOGATION}
        cxx_std_${PRJ_CXX_STANDARD}
    )
endmacro()

# Apply the project specified C standard to a target
macro(use_project_c_standard TARGET PROPOGATION)
    target_compile_features(
        ${TARGET}

        ${PROPOGATION}
        c_std_${PRJ_C_STANDARD}
    )
endmacro()
