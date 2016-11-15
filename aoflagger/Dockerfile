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
RUN apt-get -y install libcfitsio3-dev libxml2-dev libpng12-dev
RUN apt-get -y install libboost-all-dev
RUN apt-get -y install libfftw3-dev
RUN apt-get -y install libgtkmm-3.0-dev
RUN apt-get -y install gtk2-engines gnome-icon-theme-gartoon
#RUN wget http://heanet.dl.sourceforge.net/project/aoflagger/aoflagger-2.8.0/aoflagger-2.8.0.tar.bz2
COPY aoflagger-2.8.2.tar.bz2 .
RUN tar -xvf aoflagger-2.8.2.tar.bz2
RUN cd aoflagger-2.8.2 ; mkdir build ; cd build ; cmake ../ ; make -j8 ; make install
ENTRYPOINT ["bash"]
