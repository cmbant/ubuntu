#!/bin/bash

#Clean up desktop stuff we don't want
sudo apt-get purge -y aisleriot gnome-sudoku mahjongg ace-of-penguins ubuntuone-installer \
      gnomine thunderbird rhythmbox hplip empathy britty brasero shotwell telepathy-idle
sudo apt-get purge -y ttf-indic-fonts-core ttf-kacst-one ttf-khmeros-core ttf-lao ttf-punjabi-fonts ttf-takao-pgothic ttf-thai-tlwg ttf-unfonts-core ttf-wqy-microhei
sudo apt-get remove  -y --purge libreoffice*
sudo apt-get remove -y unity-webapps-common

# New things for developer machine ready for gcc building etc.

sudo apt-get install -y \
     bison \
     build-essential \
     curl \
     flex \
     g++ \
     git \
     libmpc-dev \
     liblapack-dev \
     openmpi-bin \
     libopenmpi-dev \
     wget 