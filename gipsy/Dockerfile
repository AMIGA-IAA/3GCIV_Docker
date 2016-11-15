FROM ubuntu:12.04
MAINTAINER Ben Hugo "bhugo@ska.ac.za"
#gipsy dependencies
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y tar wget
RUN apt-get install -y build-essential gfortran
RUN apt-get install -y f2c
RUN apt-get install -y xaw3dg-dev libxmu-dev libx11-dev libice-dev libsm-dev libxext-dev libxt-dev
RUN apt-get install -y libncurses5-dev 
RUN apt-get install -y libvtk5-dev python-vtk
RUN apt-get install -y python-pip
RUN apt-get install -y python2.7-dev
RUN apt-get install -y python-tk
RUN pip install numpy networkx sampy 
RUN apt-get install -y python-pyfits
RUN apt-get install -y python-matplotlib #does not work with newer matplotlib
RUN pip install astropy
RUN apt-get install -y python-qt4 
RUN ln -s /usr/include/vtk-5.8 /usr/include/vtk
RUN apt-get install -y libggi2-dev #package removed... 12.04 is the last version with this
RUN apt-get install -y ncurses-base libncursesw5-dev
RUN apt-get install -y libxaw7-dev x11-utils
RUN apt-get install -y libicu48
RUN apt-get install -y strace
#Grab latest gipsy:
RUN apt-get install -y tcsh 

COPY gipsy_install.csh /
RUN useradd -ms /bin/bash gipsy
USER gipsy
WORKDIR /home/gipsy
RUN mkdir gipsy_install
RUN chmod 777 gipsy_install
RUN ["csh", "-c", "printf \"gipsy_install\\nY\" | /gipsy_install.csh"]
ENV gip_root "/home/gipsy/gipsy_install"
ENV gip_arch linux64
ENV gip_dat ${gip_root}/dat                 
ENV gip_doc ${gip_root}/doc                 
ENV gip_exe ${gip_root}/exe/${gip_arch}
ENV gip_htm ${gip_root}/htm               
ENV gip_inc ${gip_root}/inc           
ENV gip_lib ${gip_root}/lib/${gip_arch}
ENV gip_loc ${gip_root}/loc              
ENV gip_mis ${gip_root}/mis            
ENV gip_old ${gip_root}/old               
ENV gip_sub ${gip_root}/sub
ENV gip_tsk ${gip_root}/tsk
ENV gip_host Generic-Linux
ENV gip_sys ${gip_root}/sys
ENV gip_mode 231
ENV PATH $PATH:${gip_root}/exe/linux64
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:${gip_root}/lib/linux64
ENV DISPLAY :0

USER root
RUN pip install pillow
#install the docs
RUN cd ${gip_htm} ; wget ftp://ftp.astro.rug.nl/gipsy/GIPSY_HTML.tar.gz ; gunzip < GIPSY_HTML.tar.gz | tar xvf - 
#install jre
RUN apt-get -y install default-jre
RUN wget http://www.star.bris.ac.uk/~mbt/topcat/topcat-full.jar
RUN wget http://aladin.u-strasbg.fr/java/download/Aladin.jar
RUN chmod +x topcat-full.jar
RUN chmod +x Aladin.jar
#ENTRYPOINT tcsh
ENTRYPOINT ["tcsh", "-c", "java -jar ~gipsy/topcat-full.jar & java -jar ~gipsy/Aladin.jar & ${gip_sys}/gipsy.csh"]
