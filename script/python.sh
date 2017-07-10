sudo apt-get install -y \
 python-pip \
 python-pyside \
 python-matplotlib \
 python-scipy \
 python-h5py \
 python-sympy \
 cython \
 ipython \
 ipython-notebook

# may want these e.g. for scipy upgrade install via pip
# libfreetype6-dev \
# libxft-dev

sudo apt-get install -y --no-install-recommends python-pandas

sudo pip install starcluster

echo "export PYTHONPATH=/vagrant/python:$PYTHONPATH" >> /home/ubuntu/.bashrc

