 echo "==> Cloning gcc repository"
 git clone git://gcc.gnu.org/git/gcc.git --branch vehre/head_cosmo --single-branch --depth=1
 pushd gcc
 mkdir objdir
 cd objdir
 echo "==> Configure gcc"
 #Note that c has to be compiled at least once to get OPENMP4 library built, even if you only want fortran
 ../configure --enable-languages=c,c++,fortran --disable-multilib \
    --disable-bootstrap --enable-checking=release --build=x86_64-linux-gnu
 echo "==> Build gcc (takes a while and a lot of memory)"
 make -j 2 2> /home/ubuntu/gcc/gcc_build_errlog.txt > /home/ubuntu/gcc/gcc_build_log.txt
 echo "==> Install gcc"
 sudo make install gcc > /home/ubuntu/gcc/gcc_install_log.txt
 sudo make distclean
 cd ..
 rm -Rf objdir
 popd

 #add the new version libraries to the path
 sudo sed -i '1s/^/\/usr\/local\/lib64\n/' /etc/ld.so.conf
 sudo ldconfig



