# luvweb
A sample web app using just lua and luv.

## Making Luv

To build the luv library you need to install **cmake**, **lua**, and **openssl**
on your system.  For example on a fresh Ubuntu system, you would do:

```sh
sudo apt-get install build-essential cmake liblua5.2-dev lua5.2 libssl-dev
```

Once you have these dependencies, clone this repo and run `make`.

```sh
git clone https://github.com/creationix/luvweb.git
cd luvweb
make
```

## Starting app

Once you have `src/luv.so` built successfully, simply enter the src directory
and run `boot.lua` with `lua`.  Or if you're lazy, use the `run` target in the
Makefile.

```sh
make run
```
