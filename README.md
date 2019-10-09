
# An example of cross compiling for Raspberry PI on MacOSX, using:
See [this](https://github.com/subatomicglue/cross-compile-macosx-clang-windows-msvc) for a production version. (This is a simplified toy example)

- MacOSX LLVM tools
  http://releases.llvm.org/4.0.0/clang+llvm-4.0.0-x86_64-apple-darwin.tar.xz

- bintools toolchain compiled for arm-linux-gnueabihf
  http://ftp.gnu.org/gnu/binutils/binutils-2.28.tar.gz

- native RaspberryPi lib/includes
  copied from a working RaspberryPi


# Install & Build:
Start a terminal and type the commands:
```
# download/build/install bintools for MacOSX, enabled to output for Raspberry Pi
# download/install llvm for MacOSX (uses bintools to build for rPI)

./install-raspberrypi-toolchain.sh

# copy native raspberry pi include and lib directories for compiling
# - attach a raspberry pi to your network
# - edit top of this file with your user/host
# - then run:

./install-raspberrypi-sysroot.sh
```

you should see this directory created
```
~/RPI_SDK/
 - sysroot/
   - lib/
   - usr/
 - binutils-2.28/
   - build/
     - arm-linux-gnueabihf/
     - bin/
     - include/
     - lib/
     - libexec/
     - share/
```

# Building the example
Start a terminal and type
```
make
```

Outputs `main`. You should upload `main` to a raspberry pi and run it:
```
scp main pi@pi:/home/pi/
ssh pi@pi
```

On the rPI:
```
./main
```

Outputs:
```
hello world!
```
