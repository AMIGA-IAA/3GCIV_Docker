FROM radioastro/base
MAINTAINER Ben Hugo "bhugo@ska.ac.za"
#Radio-astro repo\n\
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y -s ppa:radio-astro/main
RUN apt-get update
RUN apt-get install -y wget tar cvs

#Miriad specific dependencies
RUN apt-get -y install csh
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
RUN apt-get -y install man
RUN apt-get -y install autoconf autogen libtool
#Grab latest miriad:
COPY miriad.tar.gz .
COPY josh_special.tar.gz .
RUN tar -xvf miriad.tar.gz
RUN tar -xvf josh_special.tar.gz
RUN cd miriad; cvs update
RUN cp josh_special/src/prog/calib/*   miriad/src/prog/calib/
RUN cp josh_special/src/prog/convert/* miriad/src/prog/convert
RUN cp josh_special/src/prog/disp/*    miriad/src/prog/disp/
RUN cp josh_special/src/prog/vis/*     miriad/src/prog/vis/
RUN cp josh_special/src/prog/wsrt/*    miriad/src/prog/wsrt/
RUN cp josh_special/src/subs/*         miriad/src/subs/

#Install miriad
RUN cd miriad ; ./autogen.sh; ./configure --with-wcslib=/usr/lib/x86_64-linux-gnu --with-x --with-telescope=wsrt F77=gfortran --with-maxbuf=8388608 --with-maxdim=65536 --with-maxdim2=8192 --with-maxant=64 --with-maxant2=30 --with-maxbase=2048 --with-maxbase2=2048 --with-maxchan=8192 --with-maxwin=16 --with-maxwide=32 --with-maxpnt=10000000; make; make install

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib

#wand / imagemagic
RUN apt-get -y install libmagickwand-dev
RUN apt-get -y install libmagickcore5-extra

ENTRYPOINT . /usr/local/lib/miriad/automiriad.sh && env && /bin/bash
