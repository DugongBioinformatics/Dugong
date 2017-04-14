###########################################################################
# Dugong - Scientific Linux Containers for Bioinformatic
# ======================================================
#
# Current development is led by Fabiano Menegidio.
#
# Bioinformatician/Bioinformaticist at the Laboratory of Functional 
# and Structural Genomics of the Integrated Nucleus of Biotechnology 
# at the University of Mogi das Cruzes, Brazil.
# 
# Contact: fabiano.menegidio@biology.bio.br
# GitHub: https://github.com/fabianomenegidio
#
#
###########################################################################

FROM ubuntu:latest
MAINTAINER Fabiano Menegidio <fabiano.menegidio@biology.bio.br>

###############  Connection ports for controlling the UI:
# VNC port:5901
# noVNC webport, connect via http://IP:6901/?password=vncpassword
############### 
ENV DISPLAY :1
ENV VNC_PORT 5901
ENV NO_VNC_PORT 6901
EXPOSE $VNC_PORT $NO_VNC_PORT

ENV HOME /headless
ENV STARTUPDIR /dockerstartup
WORKDIR $HOME

############### Environment config
ENV DEBIAN_FRONTEND noninteractive
ENV NO_VNC_HOME $HOME/noVNC
ENV VNC_COL_DEPTH 24
ENV VNC_PW vncpassword

############### Resolution Chromebook (change to your default resolution)
ENV VNC_RESOLUTION 1366x768

############### Add linux-mint dependencies and update packages
RUN apt-key adv --recv-key --keyserver keyserver.ubuntu.com "3EE67F3D0FF405B2"
RUN echo "deb http://packages.linuxmint.com/ rafaela main upstream import" >> /etc/apt/sources.list.d/mint.list && \
    echo "deb http://extra.linuxmint.com/ rafaela main " >> /etc/apt/sources.list.d/mint.list 

############### Add all install scripts for further steps
ENV INST_SCRIPTS $HOME/install
ADD .config/install/ $INST_SCRIPTS/
RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +

############### Installation of essential packages and dependencies
RUN $INST_SCRIPTS/tools.sh

############### Install xvnc-server & noVNC - HTML5 based VNC viewer
RUN $INST_SCRIPTS/tigervnc.sh
RUN $INST_SCRIPTS/no_vnc.sh

############### Install Chrome Browser & Firefox
RUN $INST_SCRIPTS/firefox.sh
RUN $INST_SCRIPTS/chrome.sh

############## Install Install Java 8 and Icedtea Plugin 8
RUN $INST_SCRIPTS/java.sh

############### Install Mega Sync and MegaCMD
RUN $INST_SCRIPTS/mega.sh

############### Install Basemount, a FUSE driver that allows a BaseSpace
RUN $INST_SCRIPTS/basemount.sh

############### Install Linuxbrew
RUN $INST_SCRIPTS/linuxbrew.sh

############### Install Tini
RUN $INST_SCRIPTS/tini.sh

############### Download and install Miniconda2
RUN $INST_SCRIPTS/conda2.sh

############### Download and install Miniconda3
RUN $INST_SCRIPTS/conda3.sh

############### Install IceWM UI
RUN $INST_SCRIPTS/icewm_ui.sh
ADD .config/GUI/icewm/ $HOME/

############### Configure startup Dugong
RUN $INST_SCRIPTS/libnss_wrapper.sh
ADD .config/scripts $STARTUPDIR
RUN $INST_SCRIPTS/set_user_permission.sh $STARTUPDIR $HOME

USER 1982

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--tail-log"]
