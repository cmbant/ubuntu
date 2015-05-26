echo "export PYTHONPATH=/vagrant/python:$PYTHONPATH" >> /home/ubuntu/.bashrc

sudo pip install starcluster

#PICO
git clone https://github.com/marius311/pypico.git --branch master --single-branch
cd pypico
python setup.py build
python setup.py install
cd ..

#CosmoMC
git clone https://github.com/cmbant/cosmomc.git --branch master --single-branch

