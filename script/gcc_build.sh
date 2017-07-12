#should be able to use e.g. https://gist.github.com/application2000/73fd6f4bf1be6600a2cf9f56315a2d91

 echo "==> Cloning gcc repository"
 #git clone git://gcc.gnu.org/git/gcc.git --branch gcc-6-branch --single-branch --depth=1
 wget https://codeload.github.com/gcc-mirror/gcc/zip/gcc-6-branch 
 unzip gcc-6-branch 
 rm -f gcc-6-branch 
 pushd gcc-gcc-6-branch
 mkdir objdir
 cd objdir
 echo "==> Configure gcc"
 #Note that c has to be compiled at least once to get OPENMP4 library built, even if you only want fortran
 ../configure --enable-languages=c,c++,fortran --disable-multilib \
    --disable-bootstrap --enable-checking=release --build=x86_64-linux-gnu
 echo "==> Build gcc (takes a while and a lot of memory)"
 make -j 2 2> /home/ubuntu/gcc-gcc-6-branch/gcc_build_errlog.txt > /home/ubuntu/gcc-gcc-6-branch/gcc_build_log.txt
 echo "==> Install gcc"
 sudo make install gcc > /home/ubuntu/gcc-gcc-6-branch/gcc_install_log.txt
 sudo make distclean
 cd ..
 rm -Rf objdir
 popd

 #add the new version libraries to the path
 sudo sed -i '1s/^/\/usr\/local\/lib64\n/' /etc/ld.so.conf
 sudo ldconfig



