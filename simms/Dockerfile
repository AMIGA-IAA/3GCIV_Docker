FROM radioastro/casa
RUN apt-get install -y python-pip
RUN apt-get update
RUN apt-get install -y git
RUN git clone http://github.com/radio-astro/simms
RUN pip install ./simms --upgrade --force-reinstall
RUN apt-get install -y python-dev
RUN pip install numpy 
CMD simms
