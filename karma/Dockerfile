FROM radioastro/base
MAINTAINER Ben Hugo "bhugo@ska.ac.za"
#gipsy dependencies
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y tar wget
RUN apt-get install -y build-essential gfortran
RUN apt-get install -y f2c
RUN apt-get install -y xaw3dg-dev libxmu-dev libx11-dev libice-dev libsm-dev libxext-dev libxt-dev libxaw7-dev
RUN apt-get install -y xviewg-dev
RUN apt-get install -y libatm1-dev
#Grab latest karma source:
RUN apt-get install -y tcsh 
#RUN wget ftp://ftp.atnf.csiro.au/pub/software/karma/archive/karma.src-v1.7.tar.gz
RUN wget ftp://ftp.atnf.csiro.au/pub/software/karma/archive/karma-1.7.20-common.tar.bz2
RUN tar -xvf karma-1.7.20-common.tar.bz2
ENV KARMAROOT /karma-1.7.20
ENV KARMABASE /karma-1.7.20/build/Linux
ENV KARMA_VERSION 1.7.20
ENV KARMALIBPATH ${KARMABASE}/lib
ENV KARMABINPATH ${KARMABASE}/bin
ENV KARMASTATICLIBPATH=${KARMABASE}/static-lib
ENV KARMAINCLUDEPATH ${KARMAROOT}/include
ENV C_INCLUDE_PATH ${KARMAROOT}/include
ENV CPLUS_INCLUDE_PATH ${KARMAROOT}/include
ENV PATH $KARMABINPATH:${KARMAROOT}/csh_script:$PATH
ENV LD_LIBRARY_PATH $KARMALIBPATH:$LD_LIBRARY_PATH
ENV MACHINE i386
ENV OS Linux
ENV MACHINE_OS Linux
RUN ls ${KARMAROOT}/include/gmakedefs
RUN echo "Patching GNUMake rules..."
COPY general.h1 /general.h1
RUN cp general.h1 ${KARMAROOT}/include/gmakedefs/general.h1
RUN echo "\t...DONE..."
RUN mkdir ${KARMAROOT}/build/Linux
RUN ${KARMAROOT}/csh_script/make_build.libs
RUN ln -s /usr/bin/make /usr/bin/gmake
RUN cd ${KARMAROOT}/build/Linux/lib ; gmake -j4
RUN mkdir ${KARMAROOT}/admin.bin
RUN mkdir ${KARMAROOT}/admin.bin/${MACHINE_OS}
ENV ADMINBINPATH ${KARMAROOT}/admin.bin/${MACHINE_OS}
ENV PATH ${ADMINBINPATH}:$PATH
RUN cd ${KARMAROOT}/source/kutil ; make ${ADMINBINPATH}/shader2c
RUN mkdir ${KARMABINPATH}
RUN ${KARMAROOT}/csh_script/make_build.modules
RUN cd ${KARMABASE}/modules ; gmake -j4
ENV MANPATH ${KARMAROOT}/man:$MANPATH
RUN apt-get -y install man
ENV DISPLAY :0
ENTRYPOINT csh

