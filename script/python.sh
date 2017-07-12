sudo wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh \
 && bash miniconda.sh -b -p $HOME/miniconda \
 && export PATH="$HOME/miniconda/bin:$PATH" \
 && hash -r \
 && conda config --set always_yes yes --set changeps1 no \
 && conda update -q conda \
 && conda info -a \
 && conda create -q -n cosmobox-environment python=2.7 atlas numpy scipy matplotlib pandas sympy h5py cython ipython jupyter pyside yaml \
 && rm -f miniconda.sh \
 && conda clean --yes -i -t -l -s -p

echo "export PATH=$HOME/miniconda/bin:$PATH" >> /home/ubuntu/.bashrc
echo "source activate cosmobox-environment" >> /home/ubuntu/.bashrc

sudo apt-get install -y qt4-default

#sudo apt-get install -y \
# python-pip \
# python-pyside \
# python-matplotlib \
# python-scipy \
# python-h5py \
# python-sympy \
# cython \
# ipython \
# ipython-notebook

# may want these e.g. for scipy upgrade install via pip
# libfreetype6-dev \
# libxft-dev
#
#sudo apt-get install -y --no-install-recommends python-pandas

sudo pip install starcluster

echo "export PYTHONPATH=/vagrant/python:$PYTHONPATH" >> /home/ubuntu/.bashrc

