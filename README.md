# luvweb
A sample web app using just lua and luv.

## Making Luv

To build the luv library you need to install cmake and lua on your system.  I
tested with Lua 5.2.3 and CMake 3.3.0 on OSX, but should work with other
combinations.  You also need your system's C compiler.

Once you have the build dependencies, clone this repo and run `make`.

```sh
git clone git@github.com:creationix/luvweb.git
cd luvweb
make
```

## Starting app

Once you have `src/luv.so` built successfully, simply enter the src directory
and run `main.lua` with `lua`.  Or if you're lazy, use the `run` target in the
Makefile.

```sh
make run
```
