if(APPLE)
  set(CMAKE_SHARED_MODULE_CREATE_C_FLAGS
    "${CMAKE_SHARED_MODULE_CREATE_C_FLAGS} -flat_namespace -undefined suppress"
  )
endif()
add_library(bit MODULE deps/bitop/bit.c)
set_target_properties(bit PROPERTIES PREFIX "")
