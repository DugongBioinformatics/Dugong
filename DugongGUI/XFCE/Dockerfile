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

############### Metadata
LABEL base.image="ubuntu:wily"
LABEL version="2017040"
LABEL name="BioBuntu"
LABEL description="Image Linux Linux"
LABEL website=""
LABEL repository=""
LABEL license=""
LABEL tags="Bioinformatics"

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

############### Add dependencies and update packages
RUN apt-key adv --recv-key --keyserver keyserver.ubuntu.com "A6616109451BBBF2" \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 \
    && echo "deb http://packages.linuxmint.com sarah main upstream import backport" >> /etc/apt/sources.list.d/mint.list \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo 'deb http://nebc.nerc.ac.uk/bio-linux/ unstable bio-linux' >> /etc/apt/sources.list.d/biolinux.list \
    && echo 'deb http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main' >> /etc/apt/sources.list.d/biolinux.list \
    && echo 'deb-src http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main' >> /etc/apt/sources.list.d/biolinux.list \
    && echo 'deb http://cran.r-project.org/bin/linux/ubuntu precise/' >> /etc/apt/sources.list.d/biolinux.list \
    && apt-get update \
    && apt-get install -y --allow-unauthenticated --force-yes bio-linux-keyring \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

############### Add all install scripts for further steps
ENV INST_SCRIPTS $HOME/install
ADD .config/install/ $INST_SCRIPTS/
RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +

############### Installation of essential packages and dependencies
RUN $INST_SCRIPTS/tools.sh \
    && $INST_SCRIPTS/tigervnc.sh \
    && $INST_SCRIPTS/no_vnc.sh \
    && $INST_SCRIPTS/firefox.sh \
    && $INST_SCRIPTS/chrome.sh \
    && $INST_SCRIPTS/java.sh \
    && $INST_SCRIPTS/mega.sh \
    && $INST_SCRIPTS/basemount.sh \
    && $INST_SCRIPTS/linuxbrew.sh \
    && $INST_SCRIPTS/tini.sh \
    && $INST_SCRIPTS/conda2.sh \
    && $INST_SCRIPTS/conda3.sh \
    && $INST_SCRIPTS/xfce_ui.sh

ADD .config/GUI/xfce/ $HOME/

############### http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
ENV LANG C.UTF-8

############### Configure startup Dugong
ADD .config/scripts $STARTUPDIR
RUN find $STARTUPDIR -name '*.sh' -exec chmod a+x {} + \
    && $STARTUPDIR/generate_container_user.sh
ADD .config/scripts/.bashrc $HOME/.bashrc
RUN $INST_SCRIPTS/set_user_permission.sh $STARTUPDIR $HOME

############### Clean apt-get
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/data", "/config"]
RUN chown -R dugong:dugong /data && \
    chown -R dugong:dugong /config

ENTRYPOINT ["tini", "--"]
ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--tail-log"]

WORKDIR /data
USER dugong
