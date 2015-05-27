#You also need to install the data file from
#https://sites.google.com/a/ucdavis.edu/pico/download
#For use with CosmoMC, put the file in ./pico folder under cosmomc's main folder

#PICO
git clone https://github.com/marius311/pypico.git --branch master --single-branch
cd pypico
python setup.py build
python setup.py install
cd ..

