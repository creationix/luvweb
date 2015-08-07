OS:=$(shell uname -s)
ifeq ($(OS),Darwin)
# bitlib needs a flag on macs
BIT_EXTRA:=macosx
endif
ifeq ($(OS),Linux)
# Look for system lua on linux
export PREFIX=/usr
endif

ifdef GENERATOR
	CMAKE_FLAGS+= -G"${GENERATOR}"
endif

libs: src/luv.so src/openssl.so src/bit.so

run: libs
	cd src && lua boot.lua

deps/luv/deps/libuv/include:
	git submodule update --init
	cd deps/luv && git submodule update --init deps/libuv

build: deps/luv/deps/libuv/include
	mkdir build
	cmake $(CMAKE_FLAGS) -H. -Bbuild
	cmake --build build --config Release

src/luv.so: build
	cp build/deps/luv/luv.so src/luv.so
src/openssl.so: build
	cp build/liblua_openssl.so src/openssl.so
src/bit.so: build
	cp build/bit.so src/bit.so

clean:
	rm -rf build
