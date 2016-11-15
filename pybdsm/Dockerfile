FROM radioastro/base
MAINTAINER Ben Hugo "bhugo@ska.ac.za"
#Package dependencies\n\
ENV DISPLAY :0
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y -s ppa:radio-astro/main
RUN apt-get update
RUN apt-get install -y python-matplotlib
RUN apt-get install -y lofar
RUN apt-get install -y python-pip
RUN pip install pip --upgrade
RUN pip install ipython --upgrade
RUN pip install jupyter --upgrade
RUN pip install astropy scipy numpy aplpy astropy

ENTRYPOINT ["pybdsm"]
