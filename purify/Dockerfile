FROM ubuntu:16.04
MAINTAINER Ben Hugo "bhugo@ska.ac.za"
#Package dependencies\n\
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y -s ppa:kernsuite/kern-1
RUN apt-add-repository -y multiverse
RUN apt-get update
RUN apt-get -y install wget git
#dependencies
RUN apt-get install -y python3 python3-dev python3-numpy python3-setuptools \
python3-pytest python3-pandas python3-pip cython3
RUN apt-get update && apt-get install -y g++ cmake cmake-extras \
extra-cmake-modules libeigen3-dev git libtiff-dev libfftw3-dev
RUN pip3 install PyWavelets
RUN apt-get -y install build-essential
RUN apt-get -y install libtiff5-dev 
RUN apt-get -y install python-pip
RUN pip3 install pip -U
RUN pip3 install numpy
RUN pip3 install scipy
RUN pip3 install pandas
RUN pip3 install cython
RUN pip3 install pytest
RUN apt-get -y install mercurial
RUN apt-get -y install pkg-config
RUN apt-get -y install fftw3-dev
#RUN apt-get install -y libcasacore21-dev
#RUN wget https://cmake.org/files/v3.7/cmake-3.7.0-rc1.tar.gz
#RUN tar -xvf cmake-3.7.0-rc1.tar.gz
#RUN cd cmake-3.7.0-rc1; ./configure; make -j8; make install

#RUN apt-get -y install python-dev
#RUN apt-get -y install libeigen3-dev
#RUN pip install PyWavelets
#RUN apt-get -y install libboost-all-dev
#RUN apt-get -y install libcfitsio3-dev
#RUN apt-get -y install libcasacore2-
#RUN apt-get -y install libccfits-dev libccfits0
#checkout latest purify and sopt
RUN git clone https://github.com/google/benchmark
RUN cd benchmark; mkdir build; cd build; cmake ../; make -j8; make install
RUN git clone https://github.com/gabime/spdlog
RUN cd spdlog; mkdir build; cd build; cmake ../; make -j8; make install
RUN git clone http://github.com/basp-group/sopt
RUN cd sopt; mkdir build; cd build; cmake -DPYTHON_EXECUTABLE=$(which python3) -Dregressions=OFF -DCMAKE_BUILD_TYPE=Release ../; make -j8; make install
RUN git clone http://github.com/basp-group/purify
RUN apt-get install -y casacore-dev
RUN cd purify; mkdir build; cd build; cmake -DPYTHON_EXECUTABLE=$(which python3) -Ddata=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../; make
RUN cd purify/build; ctest .
RUN cd purify/build; cmake -DCMAKE_INSTALL_PREFIX=/usr ../; make install 
ENTRYPOINT ["bash"]
