#!/bin/bash -eux

sudo wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh \
 && bash miniconda.sh -b -p $HOME/miniconda \
 && export PATH="$HOME/miniconda/bin:$PATH" \
 && hash -r \
 && conda config --set always_yes yes --set changeps1 no \
 && conda update -q conda \
 && conda info -a \
 && conda create -q -n cosmobox-environment scipy matplotlib pandas sympy cython ipython jupyter PyYAML pyside\
 && rm -f miniconda.sh \
 && conda clean --yes -i -t -l -s -p

echo "export PATH=$HOME/miniconda/bin:$PATH" >> /home/ubuntu/.bashrc
echo "source activate cosmobox-environment" >> /home/ubuntu/.bashrc

sudo apt-get install -y qt4-default
#sudo apt-get install -y qt5-default
#conda install -y -c conda-forge pyside2

source activate cosmobox-environment
pip install mpi4py

# may want these e.g. for scipy upgrade install via pip
# libfreetype6-dev \
# libxft-dev
#

#sudo pip install starcluster

echo "export PYTHONPATH=/vagrant/python:$PYTHONPATH" >> /home/ubuntu/.bashrc

