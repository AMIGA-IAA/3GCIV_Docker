FROM radioastro/base
MAINTAINER Ben Hugo "bhugo@ska.ac.za"
#Radio-astro repo\n\
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y -s ppa:radio-astro/main
RUN apt-get update
RUN apt-get install -y wget tar
#Grab latest miriad:
RUN wget ftp://ftp.atnf.csiro.au/pub/software/miriad/miriad-code.tar.bz2
RUN tar -xvf miriad-code.tar.bz2
RUN wget ftp://ftp.atnf.csiro.au/pub/software/miriad/miriad-common.tar.bz2
RUN tar -xvf miriad-common.tar.bz2
#Miriad specific dependencies
RUN apt-get -y install csh
RUN apt-get -y install cvs
RUN apt-get -y install libx11-dev
RUN apt-get -y install libbsd-dev
RUN apt-get -y install libreadline-dev
RUN apt-get -y install build-essential
RUN apt-get -y install gfortran
RUN apt-get -y install flex
RUN apt-get -y install pgplot5
RUN apt-get -y install wcslib-dev
RUN apt-get -y install libxaw7-dev
RUN apt-get -y install xorg-dev 
RUN apt-get -y install rpfits
RUN apt-get -y install xbitmaps
#Install miriad
RUN cd miriad ; ./configure --with-wcslib=/usr/lib/x86_64-linux-gnu ;  make

#Put her in the path
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN source /miriad/MIRRC.sh
ENV LD_LIBRARY_PATH /miriad/linux64/lib:$LD_LIBRARY_PATH
ENV PATH /miriad/linux64/bin:$PATH
ENV MANPATH /miriad/linux64/man:$MANPATH
#install man util
RUN apt-get -y install man
ENTRYPOINT . /miriad/MIRRC.sh && env && /bin/bash
