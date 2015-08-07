cmake_minimum_required(VERSION 2.8.9)

if(WIN32)
  set(projects C ASM ASM_MASM)
else()
  set(projects C ASM)
endif()

project(luvweb ${projects})

# Build luv as a lua module (dll/so)
set(WITH_LUA_ENGINE "Lua" CACHE STRING "Link to LuaJIT or PUC Lua")
set(LUA_BUILD_TYPE "System" CACHE STRING "Build Lua/LuaJIT as static, dynamic libary, or use system one")
add_subdirectory(deps/luv)

# Build bitop as a lua module (dll/so)
include(deps/bitop.cmake)

# Build static lua-openssl with assembly as a lua module (dll/so)
if(APPLE OR WIN32)
option(WithSharedOpenSSL "Shared or Static OpenSSL" OFF)
option(OPENSSL_ENABLE_ASM "Enable Assembly Optimizations" OFF)
endif()
include(deps/openssl.cmake)
