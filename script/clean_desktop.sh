echo "==> Removing unnecessary desktop files"

apt-get purge -y aisleriot gnome-sudoku mahjongg ace-of-penguins ubuntuone-installer \
      gnomine thunderbird rhythmbox hplip empathy britty brasero shotwell telepathy-idle
apt-get purge -y ttf-indic-fonts-core ttf-kacst-one ttf-khmeros-core ttf-lao ttf-punjabi-fonts ttf-takao-pgothic ttf-thai-tlwg ttf-unfonts-core ttf-wqy-microhei
apt-get -y purge popularity-contest installation-report wireless-tools wpasupplicant
apt-get remove  -y --purge libreoffice* unity-webapps-common
