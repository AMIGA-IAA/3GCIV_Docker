FROM comm-base:latest

MAINTAINER Tom Mauch <tmauch@ska.ac.za>

RUN apt-get install -y cvs 
RUN apt-get install -y x11-xserver-utils

WORKDIR /usr/local/AIPS

RUN wget ftp://ftp.aoc.nrao.edu/pub/software/aips/31DEC16/install.pl

#remove root user check:
RUN sed -i -e '455,461d' install.pl 

##INSTALL AIPS - the here string just cycles through the aips install menu with (mostly) defaults.
RUN ["/bin/bash","-c","aipscmd=$'\nroot\n\nSKACOMM\nY\n\n\n/usr/local/AIPS/DATA/LOCALHOST_1\n\n\n\n\n\n\n\n\n\n\n' && perl install.pl -n <<< \"$aipscmd\""]

#Replace /etc/services with those required by aips
COPY services /etc/services

#Okay: setup complete. The following commands are executed when AIPS starts up
CMD echo "AIPStv*useSharedMemory:   0" > ${HOME}/.Xdefaults
CMD xrdb -merge ${HOME}/.Xdefaults
#Handle mounts (specify AIPSMOUNT) using -e when running 
CMD ["/bin/bash","-c","if [ ! -d ${AIPSMOUNT} ]; then\n   echo \"You must specify AIPSMOUNT environment variable to valid mounted volume to load / store aips volumes\"; exit 1\n fi\n"]
CMD echo "Remember to mount a valid volume with uvfits files as '/usr/local/AIPS/FITS' if you want uvfits reading support"
CMD echo "Creating an AIPS mount in ${AIPSMOUNT}/LOCALHOST_2 if it doesn't exist already"
CMD echo "-  ${AIPSMOUNT}/LOCALHOST_2" >> /usr/local/AIPS/DA00/DADEVS.LIST
CMD echo "${AIPSMOUNT}/LOCALHOST_2 365.0    0    0    0    0    0    0    0    0" >> /usr/local/AIPS/DA00/NETSP
CMD ["/bin/bash","-c","printf 'if [ ! -d ${AIPSMOUNT}/LOCALHOST_2 ]; then\n   mkdir ${AIPSMOUNT}/LOCALHOST_2 && touch ${AIPSMOUNT}/LOCALHOST_2/SPACE\nfi\n'"]

CMD . /usr/local/AIPS/LOGIN.SH && aips da=all tv=local

