 git clone git://gcc.gnu.org/git/gcc.git --branch vehre/head_cosmo --single-branch
 pushd gcc
 mkdir objdir
 cd objdir
 #Note that c has to be compiled at least once to get OPENMP4 library built, even if you only want fortran
 ../configure --enable-languages=c,c++,fortran --disable-multilib \
    --disable-bootstrap --enable-checking=release --build=x86_64-linux-gnu 
 make -j 2
 make install
 make distclean
 popd
 
 #add the new version libraries to the path
 sed -i '1s/^/\/usr\/local\/lib64\n/' /etc/ld.so.conf

 
 
