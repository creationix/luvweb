run: src/luv.so
	cd src && lua main.lua

luv/deps:
	git submodule update --init luv
luv/deps/libuv/include/uv.h: luv/deps
	cd luv && git submodule update --init deps/libuv
build:
	mkdir build

build/luv.so: build luv/deps/libuv/include/uv.h
	cd build && cmake ../luv -DWITH_LUA_ENGINE=Lua -DLUA_BUILD_TYPE=System
	cmake --build build --config Release

src/luv.so: build/luv.so
	cp build/luv.so src/luv.so

clean:
	git clean -xdf
