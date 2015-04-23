apt-get install -y openjdk-7-jre

pushd
cd /tmp
wget "http://downloads.sourceforge.net/project/cbfortran/CBFortran_v1.2/CodeBlocks_Fortran_v1.2_Linux64.tar.bz2?use_mirror=autoselect&ts=$(date +%s)"
tar -jxvf -C /opt download
mv CodeBlo* /opt/
popd

#pushd
#cd /tmp
#curl http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/tools/ptp/builds/8.1.2/ptp-linux-gtk-x86_64-8.1.2.tar.gz \
#  | tar -xz
#mv eclipse /opt/eclipse
#popd