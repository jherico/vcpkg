include(vcpkg_common_functions)

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage DESTINATION ${CURRENT_PACKAGES_DIR}/share/openssl/)
