echo "==> Removing unnecessary desktop files"
#Only needed if included recommends for ubuntu-desktop

#apt-get purge -y aisleriot gnome-sudoku gnome-mahjongg ace-of-penguins ubuntuone-installer \
#      gnomine rhythmbox hplip brasero shotwell telepathy-idle
#apt-get remove -y ttf-indic-fonts-core ttf-kacst-one ttf-khmeros-core ttf-lao ttf-punjabi-fonts ttf-takao-pgothic ttf-thai-tlwg ttf-unfonts-core ttf-wqy-microhei

#commented as these seem to uninstall desktop..
#apt-get -y purge popularity-contest installation-report wireless-tools wpasupplicant
#echo "==> Removing libreoffice etc"
#apt-get remove  -y --purge libreoffice* unity-webapps-common
#apt-get remove  -y --purge thunderbird empathy transmission-gtk speech-dispatcher

mkdir logs
mv /home/ubuntu/gcc/*log* logs
rm -Rf /home/ubuntu/gcc*
rm -Rf /home/ubuntu/pictures
rm -Rf /home/ubuntu/Music
rm -Rf /home/ubuntu/Videos
rm -Rf /home/ubuntu/Templates


