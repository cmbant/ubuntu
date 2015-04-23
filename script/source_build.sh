#CFITSIO

pushd /tmp
wget ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/cfitsio_latest.tar.gz
tar zxvf cfitsio_latest.tar.gz
cd cfitsio
./configure --prefix=/usr
make -j 2
sudo make install
make clean
popd
rm -Rf /tmp/cfitsio*

#OpenMPI
# pushd /tmp
# wget https://www.open-mpi.org/software/ompi/v1.8/downloads/openmpi-1.8.4.tar.gz
# tar -zxvf openmpi-1.8.4.tar.gz
# cd openmpi-1.8.4
# ./configure --prefix=/usr
# make -j 2 all install
# make clean
# popd
# rm -Rf /tmp/openmpi*

