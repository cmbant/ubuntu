sudo apt-get install -y \
 python-pip \
 python-pyside \
 python-matplotlib \
 python-scipy \
 cython \
 ipython

# may want these e.g. for scipy upgrade install via pip
# libfreetype6-dev \
# libxft-dev

sudo apt-get install -y --no-install-recommends python-pandas

sudo pip install --upgrade ipython[all]