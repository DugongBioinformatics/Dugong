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

FROM ubuntu:wily
MAINTAINER Fabiano Menegidio <fabiano.menegidio@biology.bio.br>

############### Add dependencies and update packages
RUN apt-key adv --recv-key --keyserver keyserver.ubuntu.com "A6616109451BBBF2" \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 \
    && echo 'deb http://packages.linuxmint.com sarah main upstream import backport' >> /etc/apt/sources.list.d/mint.list \
    && echo 'deb http://nebc.nerc.ac.uk/bio-linux/ unstable bio-linux' >> /etc/apt/sources.list.d/biolinux.list \
    && echo 'deb http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main' >> /etc/apt/sources.list.d/biolinux.list \
    && echo 'deb-src http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main' >> /etc/apt/sources.list.d/biolinux.list \
    && echo 'deb http://cran.r-project.org/bin/linux/ubuntu precise/' >> /etc/apt/sources.list.d/biolinux.list \
    && apt-get update \
    && apt-get install -y --allow-unauthenticated --force-yes bio-linux-keyring \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends make grep sed sudo dpkg git wget zip build-essential python openssh-server \
    python-dev python-pip bzip2 mercurial locales ca-certificates subversion vim gdebi-core bash-completion apt-utils \
    openjdk-8-jre unzip curl ruby net-tools libglib2.0-0 libxext6 libsm6 libxrender1 g++ ruby-dev rubygems libtinfo-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /var/run/sshd
  
############### http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
ENV LANG C.UTF-8
	
############### Install Tini
RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.10.0/tini && \
    echo "1361527f39190a7338a0b434bd8c88ff7233ce7b9a4876f3315c22fce7eca1b0 *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini
    
ENV CONDA2_DIR /opt/conda2
ENV PATH $CONDA2_DIR/bin:$PATH
ENV SHELL /bin/bash
ENV NB_USER dugong
ENV NB_PASS dugong
ENV NB_UID 1000
ENV HOME /home/$NB_USER
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

############### RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    
RUN echo "User: $NB_USER Pass: $NB_PASS" && \
	useradd --create-home --shell /bin/bash --user-group --groups adm,sudo $NB_USER && \
	echo "$NB_USER:$NB_PASS" | chpasswd && \
    	mkdir -p $CONDA2_DIR && \
    	chown $NB_USER $CONDA2_DIR

USER $NB_USER

############### Download and install Miniconda2
RUN cd /tmp && \
    mkdir -p $CONDA2_DIR && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    /bin/bash Miniconda2-latest-Linux-x86_64.sh -f -b -p $CONDA2_DIR && \
    rm Miniconda2-latest-Linux-x86_64.sh && \
    $CONDA2_DIR/bin/conda config --system --add channels conda-forge && \
    $CONDA2_DIR/bin/conda config --system --set auto_update_conda false && \
    conda clean -tipsy   

############### Set path to point to conda
ENV PATH $CONDA2_DIR/bin:$PATH

############### Add bioconda channels
RUN conda config --add channels r && \
    conda config --add channels bioconda && \
    conda clean -tipsy

############### Install Linuxbrew
ENV SHELL /bin/bash
RUN git clone https://github.com/Linuxbrew/linuxbrew.git $HOME/.linuxbrew && \
    echo "export PATH="$HOME/.linuxbrew/bin:$PATH"" >> $HOME/.bashrc && \
    echo "export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"" >> $HOME/.bashrc && \
    echo "export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"" >> $HOME/.bashrc  
    
USER root

###############  tty.js
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7917B12 \
	&& apt-get update \
	&& apt-get install -y --force-yes nodejs \
	&& apt-get clean
ADD tty.js /tty.js/

###############  Install showterm - record terminal / shell
RUN gem install showterm

############### Install Basemount, a FUSE driver that allows a BaseSpace user access to their data.
RUN bash -c "$(curl -L https://basemount.basespace.illumina.com/install)"

EXPOSE 22
EXPOSE 3000

COPY .config/startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

VOLUME ["/data", "/config"]
RUN chown -R dugong:dugong /data && \
    chown -R dugong:dugong /config 

# Configure container startup
ENTRYPOINT ["tini", "--"]
CMD ["/usr/local/bin/startup.sh"]
