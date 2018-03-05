
function(custom_configure_build)
    if(CMAKE_CONFIGURATION_TYPES)
        # Debug configurations
        set(DEBUG_CONFIGURATIONS DEBUG CACHE INTERNAL "" FORCE)
        # Release (optimized) configurations
        set(RELEASE_CONFIGURATIONS RELEASEMT CACHE INTERNAL "" FORCE)
        # CMAKE_CONFIGURATION_TYPES variable defines build configurations generated by cmake
        set(CMAKE_CONFIGURATION_TYPES Debug ReleaseMT CACHE STRING "Configuration types: Debug, ReleaseMT" FORCE)

        set(CMAKE_CXX_FLAGS_RELEASEMT "/MT" CACHE INTERNAL "" FORCE)
        set(CMAKE_C_FLAGS_RELEASEMT "/MT" CACHE INTERNAL "" FORCE)
        set(CMAKE_EXE_LINKER_FLAGS_RELEASEMT "/OPT:REF" CACHE INTERNAL "" FORCE)
        set(CMAKE_SHARED_LINKER_FLAGS_RELEASEMT "/OPT:REF" CACHE INTERNAL "" FORCE)
    endif()
endfunction()

function(custom_configure_target TARGET)
    set_target_properties(${TARGET} PROPERTIES
        STATIC_LIBRARY_FLAGS_RELEASEMT /LTCG
    )
    #set(TARGET_CONFIGURATION_COMPLETE TRUE PARENT_SCOPE)
endfunction()