#!/bin/bash -eux

pushd /tmp
wget "http://downloads.sourceforge.net/project/cbfortran/CBFortran_v1.3/CodeBlocks_Fortran_v1.3_Linux64.tar.bz2?use_mirror=autoselect&ts=$(date +%s)"
tar -jxvf CodeBlo*
rm -f *.tar*
mv CodeBlo* /opt/
cat <<EOT > /opt/CodeBlocks_Fortran_v1.3_Linux64/CodeBlocks.desktop
[Desktop Entry]
Version=1.0
Name=CodeBlocks
Comment=Fortran IDE
Exec=/opt/CodeBlocks_Fortran_v1.3_Linux64/codeblocks_run.sh
Icon=/opt/CodeBlocks_Fortran_v1.3_Linux64/share/codeblocks/images/codeblocks.png
Terminal=false
Type=Application
Categories=Utility;
EOT
desktop-file-install /opt/CodeBlocks_Fortran_v1.3_Linux64/CodeBlocks.desktop
#added to launcher in user_config.sh run as user
popd

#apt-get install -y openjdk-7-jre
#pushd
#cd /tmp
#curl http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/tools/ptp/builds/8.1.2/ptp-linux-gtk-x86_64-8.1.2.tar.gz \
#  | tar -xz
#mv eclipse /opt/eclipse
#popd

