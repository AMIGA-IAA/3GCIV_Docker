FROM sofia_3gciv
MAINTAINER Ben Hugo "bhugo@ska.ac.za"
RUN apt-get -y install gnudatalanguage gdl-astrolib gdl-mpfit libplplot-dev
RUN git clone https://github.com/PeterKamphuis/FAT.git ; cd FAT ; git checkout FAT-GDL-Beta
WORKDIR FAT
RUN cd Support ; ln -s /SoFiA-1.0.0/sofia_pipeline.py sofia_pipeline.py
RUN echo "!PATH=!PATH+':/usr/share/gnudatalanguage/astrolib:/usr/share/gnudatalanguage/coyote:/usr/share/gnudatalanguage/mpfit'" > /.gdlstartup
ENV SHELL /bin/bash
ENV GDL_STARTUP /.gdlstartup
RUN sed -i -- "s/NCORES= 4/NCORES= 1/g" /FAT/Support/1stfit.def
RUN sed -i -- "s/NCORES= 4/NCORES= 1/g" /FAT/Support/2ndfit.def
RUN apt-get install -y imagemagick
ENTRYPOINT echo "!PATH=!PATH+':/usr/share/gnudatalanguage/astrolib:/usr/share/gnudatalanguage/coyote:/usr/share/gnudatalanguage/mpfit'" > ~/.gdlstartup && bash
