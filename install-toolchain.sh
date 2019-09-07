
# download binutils from here: http://ftp.gnu.org/gnu/binutils/

ARGC=$#
ARGV=("$@")

SDK=$HOME/RPI_SDK
if [ 0 -lt $ARGC ]; then
  SDK=${ARGV[0]}
  echo "Installing to SDK directory: $SDK"
fi


BINUTILS=binutils-2.28
mkdir -p $SDK

# download and unpack binutils to sdk/
cd $SDK
rm -rf $BINUTILS
curl -L -O http://ftp.gnu.org/gnu/binutils/$BINUTILS.tar.gz
tar -zxvf $BINUTILS.tar.gz
rm $BINUTILS.tar.gz
cd -

# build the binutils
cd $SDK/$BINUTILS
./configure --prefix=`pwd`/build \
            --target=arm-linux-gnueabihf \
            --enable-gold=yes \
            --enable-ld=yes \
            --enable-targets=arm-linux-gnueabihf \
            --enable-multilib \
            --enable-interwork \
            --disable-werror \
            --quiet
make -j 16 && make install
cd -


# install clang into the sdk/binutils
cd $SDK
curl -L -O http://releases.llvm.org/4.0.0/clang+llvm-4.0.0-x86_64-apple-darwin.tar.xz
xz -d clang+llvm-4.0.0-x86_64-apple-darwin.tar.xz
tar xf clang+llvm-4.0.0-x86_64-apple-darwin.tar -C $BINUTILS/build --strip-components=1
rm clang+llvm-4.0.0-x86_64-apple-darwin.tar
cd -

