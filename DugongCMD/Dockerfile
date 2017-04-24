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
LABEL base.image="ubuntu:latest"
LABEL version="2017040"
LABEL name="Dugong"
LABEL flavour="CMD"
LABEL description="Scientific Linux Container"
LABEL website="https://fabianomenegidio.github.io/dugong-bioinformatics/"
LABEL repository="https://github.com/fabianomenegidio/dugong-bioinformatics"
LABEL license="https://github.com/fabianomenegidio/dugong-bioinformatics/blob/master/LICENSE"
LABEL tags="Bioinformatics"

############### Environment config
ENV HOME /headless
ENV STARTUPDIR /dockerstartup
WORKDIR $HOME
ENV DEBIAN_FRONTEND noninteractive

############### Add Linux Mint dependencies and update packages
RUN apt-key adv --recv-key --keyserver keyserver.ubuntu.com "A6616109451BBBF2"
RUN echo "deb http://packages.linuxmint.com sarah main upstream import backport" >> /etc/apt/sources.list.d/mint.list && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

############### Add Xenial dependencies and update packages
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial main restricted universe multiverse" >> /etc/apt/sources.list.d/xenial.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list.d/xenial.list  && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-backports main restricted universe multiverse"  && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-security main restricted universe multiverse" >> /etc/apt/sources.list.d/xenial.list

############### Add BioLinux 8 dependencies and update packages
RUN echo 'deb http://nebc.nerc.ac.uk/bio-linux/ unstable bio-linux' >> /etc/apt/sources.list.d/biolinux.list && \
    echo 'deb http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main' >> /etc/apt/sources.list.d/biolinux.list && \
    echo 'deb-src http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main' >> /etc/apt/sources.list.d/biolinux.list && \
    echo 'deb http://cran.r-project.org/bin/linux/ubuntu precise/' >> /etc/apt/sources.list.d/biolinux.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated --force-yes bio-linux-keyring && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

############### Add all install scripts for further steps
ENV INST_SCRIPTS $HOME/install
ADD .config/install/ $INST_SCRIPTS/
RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +

############### Installation of essential packages and dependencies
RUN $INST_SCRIPTS/tools.sh

############### Install Install Java 8 and Icedtea Plugin 8
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

###############  tty.js
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7917B12
RUN apt-get update
RUN apt-get install -y --force-yes nodejs
RUN apt-get clean
ADD tty.js /tty.js/

############### http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
ENV LANG C.UTF-8

############### Configure startup Dugong
ADD .config/scripts $STARTUPDIR
RUN find $STARTUPDIR -name '*.sh' -exec chmod a+x {} +
RUN $STARTUPDIR/generate_container_user.sh
RUN $INST_SCRIPTS/set_user_permission.sh $STARTUPDIR $HOME

############### Add .bashrc
ADD .config/scripts/.bashrc $HOME/.bashrc

############### Clean apt-get
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/data", "/config"]
RUN chown -R dugong:dugong /data && \
    chown -R dugong:dugong /config

EXPOSE 22
EXPOSE 3000

ENTRYPOINT ["tini", "--"]
ENTRYPOINT ["/dockerstartup/startup.sh"]
CMD ["--tail-log"]

WORKDIR /data
