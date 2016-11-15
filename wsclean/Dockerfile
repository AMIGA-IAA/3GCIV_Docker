FROM radioastro/base
MAINTAINER Ben Hugo "bhugo@ska.ac.za"
#Package dependencies\n\
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y -s ppa:radio-astro/main
RUN apt-get update
RUN apt-get -y install wget
#dependencies
RUN apt-get -y install build-essential
RUN apt-get -y install cmake
RUN apt-get -y install libcasacore2-dev
RUN apt-get -y install libboost-all-dev libfftw3-dev libcfitsio3-dev libgsl0-dev

RUN apt-get -y install python-pip
RUN pip install pip -U
RUN pip install pymoresane

#LOFAR response beam
RUN apt-get install -y subversion
#RUN svn co --non-interactive --no-auth-cache --username lofar-guest --password lofar-guest https://svn.astron.nl/LOFAR/tags/LOFAR-Release-2_8_2
COPY LOFAR /LOFAR
RUN apt-get -y install liblog4cplus-dev
RUN apt-get -y install gfortran
RUN apt-get -y install libhdf5-dev libhdf5-7
RUN apt-get -y install casacore2
RUN apt-get update
RUN apt-get -y install casarest
WORKDIR LOFAR
RUN mkdir -p build/gnucxx11_opt
WORKDIR build/gnucxx11_opt
RUN cmake -DBUILD_PACKAGES="StationResponse" -DCMAKE_INSTALL_PREFIX=/usr ../../
RUN make -j16
RUN make install

#WSClean
WORKDIR /
#RUN wget http://kent.dl.sourceforge.net/project/wsclean/wsclean-1.12/wsclean-1.12.tar.bz2
COPY wsclean-1.12j.tar.bz2 .
RUN tar -xvf wsclean-1.12j.tar.bz2
RUN cd wsclean-1.12j ; mkdir build ; cd build ; cmake -DCMAKE_BUILD_TYPE=Release ../ ; make -j16 ; make install

ENTRYPOINT ["wsclean"]
