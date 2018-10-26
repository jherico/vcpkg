# Common Ambient Variables:
#   CURRENT_BUILDTREES_DIR    = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
#   CURRENT_PACKAGES_DIR      = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
#   CURRENT_PORT_DIR          = ${VCPKG_ROOT_DIR}\ports\${PORT}
#   PORT                      = current port name (zlib, etc)
#   TARGET_TRIPLET            = current triplet (x86-windows, x64-windows-static, etc)
#   VCPKG_CRT_LINKAGE         = C runtime linkage type (static, dynamic)
#   VCPKG_LIBRARY_LINKAGE     = target library linkage type (static, dynamic)
#   VCPKG_ROOT_DIR            = <C:\path\to\current\vcpkg>
#   VCPKG_TARGET_ARCHITECTURE = target architecture (x64, x86, arm)
#
if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    message(STATUS "Warning: Dynamic building not supported yet. Building static.")
    set(VCPKG_LIBRARY_LINKAGE static)
    set(VCPKG_CRT_LINKAGE dynamic)
endif()

include(vcpkg_common_functions)

vcpkg_download_distfile(
    ETC2COMP_ARCHIVE 
    URLS https://public.highfidelity.com/dependencies/etc2comp-patched.zip
    FILENAME etc2comp-patched.zip
    SHA512 4be95f09fb9edfd703c62ebc569d1bdaaf54f7f0bf4f8af51b48c2952064fd43608fae0463ae0e108eb50fef85f85f9021ee250426488fce4f60a17dd60707b6
)

vcpkg_extract_source_archive(${ETC2COMP_ARCHIVE})
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/etc2comp)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_build_cmake()

vcpkg_copy_pdbs()

