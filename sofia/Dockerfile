FROM tirific_3gciv
MAINTAINER Ben Hugo "bhugo@ska.ac.za"
RUN git clone https://github.com/SoFiA-Admin/SoFiA.git
#RUN wget https://github.com/SoFiA-Admin/SoFiA/archive/v1.0.0.tar.gz
#RUN tar -xvf v1.0.0.tar.gz
RUN apt-get -y install python-numpy python-scipy python-astropy python-matplotlib
RUN apt-get -y install build-essential libgsl0-dev qt5-qmake qt5-default
RUN apt-get -y install libwcs5 python-pywcs
#RUN cd SoFiA-1.0.0; python setup.py build --force
RUN cd SoFiA; python setup.py build --force

#ENV SOFIA_MODULE_PATH=/SoFiA-1.0.0/build/lib.linux-x86_64-2.7
#ENV SOFIA_PIPELINE_PATH="/SoFiA-1.0.0/sofia_pipeline.py"
#ENV PATH=$PATH:/SoFiA-1.0.0/gui:/SoFiA-1.0.0
ENV SOFIA_MODULE_PATH=/SoFiA/build/lib.linux-x86_64-2.7
ENV SOFIA_PIPELINE_PATH="/SoFiA/sofia_pipeline.py"
ENV PATH=$PATH:/SoFiA/gui:/SoFiA

ENTRYPOINT ["SoFiA"]
