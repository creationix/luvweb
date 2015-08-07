# luvweb
A sample web app using just lua and luv.

## Making Luv

To build the luv library you need to install **cmake** and **lua** development
headers on your system.

Once you have these dependencies, clone this repo and run `make`.

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
