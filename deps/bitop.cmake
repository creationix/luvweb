find_package(Lua)
if (LUA_FOUND)
  include_directories(${LUA_INCLUDE_DIR})
  link_directories(${LUA_LIBRARIES})
endif (LUA_FOUND)
if(APPLE)
  set(CMAKE_SHARED_MODULE_CREATE_C_FLAGS
    "${CMAKE_SHARED_MODULE_CREATE_C_FLAGS} -flat_namespace -undefined suppress"
  )
endif()
add_library(bit MODULE deps/bitop/bit.c)
set_target_properties(bit PROPERTIES PREFIX "")
