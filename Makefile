OS:=$(shell uname -s)
ifeq ($(OS),Darwin)
# bitlib needs a flag on macs
BIT_EXTRA:=macosx
endif
ifeq ($(OS),Linux)
# Look for system lua on linux
export PREFIX=/usr
endif


libs: src/luv.so src/openssl.so src/bit.so

run: libs
	cd src && lua boot.lua

src/luv.so: build/luv.so
	cp build/luv.so src/luv.so
src/openssl.so: lua-openssl/openssl.so
	cp lua-openssl/openssl.so src/openssl.so
src/bit.so: bitop/bit.so
	cp bitop/bit.so src/bit.so

luv/deps:
	git submodule update --init
luv/deps/libuv/include/uv.h: luv/deps
	cd luv && git submodule update --init deps/libuv
build:
	mkdir build

build/luv.so: build luv/deps/libuv/include/uv.h
	cd build && cmake ../luv -DWITH_LUA_ENGINE=Lua -DLUA_BUILD_TYPE=System
	cmake --build build --config Release

lua-openssl/openssl.so: luv/deps
	$(MAKE) -C lua-openssl

bitop/bit.so: luv/deps
	$(MAKE) -C bitop $(BIT_EXTRA)

clean:
	git clean -xdf
	$(MAKE) -C bitop clean
	$(MAKE) -C lua-openssl clean
