FROM ubuntu:16.04
MAINTAINER Ben Hugo "bhugo@ska.ac.za"
#Package dependencies\n\
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y -s ppa:radio-astro/main
RUN apt-add-repository -y multiverse
RUN apt-get update
RUN apt-get -y install wget
#dependencies
RUN apt-get -y install -y build-essential
RUN apt-get -y install -y cmake
RUN apt-get -y install -y casacore21
RUN apt-get -y install -y libboost-all-dev libfftw3-dev libcfitsio3-dev wcslib-dev wcstools libgsl0-dev pgplot5 doxygen gfortran libgfortran3 python-pip
RUN pip install pip -U
RUN apt-get install -y python-numpy libx11-dev
RUN pip install https://github.com/npat-efault/ppgplot/archive/1.4.tar.gz
ENV PATH /tirific/bin:/tirific:$PATH

RUN apt-get -y install git
RUN git clone http://github.com/gigjozsa/tirific.git
ENV CXX_INCLUDE_PATH /tirific/qfits-6.2.0/qloc/include:$CXX_INCLUDE_PATH
ENV C_INCLUDE_PATH /tirific/qfits-6.2.0/qloc/include:$C_INCLUDE_PATH
ENV LD_LIBRARY_PATH /tirific/qfits-6.2.0/qloc/lib:$LD_LIBRARY_PATH
RUN apt-get -y install autoconf autotools-dev libreadline-dev libpng12-dev
RUN cd tirific ; PATH=$PATH:.; make qfits ; make ; make clean
ENTRYPOINT ["bash"]
