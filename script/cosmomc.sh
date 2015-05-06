echo "export PYTHONPATH=/home/ubuntu/cosmomc/python:$PYTHONPATH" >> /home/ubuntu/.bashrc

sudo pip install starcluster
sudo pip install pypico


#PICO
git clone https://github.com/marius311/pypico.git --branch verbosefix --single-branch
pushd
cd pypico
python setup.py build
python setup.py install
popd

#CosmoMC
git clone https://github.com/cmbant/cosmomc.git --branch master --single-branch

