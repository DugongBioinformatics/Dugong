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

FROM menegidio/biobuntu
MAINTAINER Fabiano Menegidio <fabiano.menegidio@biology.bio.br>

############### Metadata
LABEL base.image="menegidio/biobuntu"
LABEL version="1.0"
LABEL name="Dugong"
LABEL flavour="Xfce4"
LABEL description="Scientific Linux Container"
LABEL website="https://fabianomenegidio.github.io/dugong-bioinformatics/"
LABEL repository="https://github.com/fabianomenegidio/dugong-bioinformatics"
LABEL license="https://github.com/fabianomenegidio/dugong-bioinformatics/blob/master/LICENSE"
LABEL tags="Bioinformatics"

###############  Connection ports for controlling the UI:
# VNC port:5901
# noVNC webport, connect via http://IP:6901/?password=vncpassword
############### 
ENV DISPLAY :1
ENV VNC_PORT 5901
ENV NO_VNC_PORT 6901
ENV NO_VNC_HOME $HOME/noVNC
ENV VNC_COL_DEPTH 24
ENV VNC_PW vncpassword
ENV VNC_RESOLUTION 1366x768
EXPOSE $VNC_PORT $NO_VNC_PORT

############### Install essentials
ADD .config/install/ $HOME/install
RUN find $HOME/install -name '*.sh' -exec chmod a+x {} + \
    && $HOME/install/conda3.sh \
    && $HOME/install/linuxbrew.sh \
    && $HOME/install/basemount.sh \
    && $INST_SCRIPTS/mega.sh \
    && $INST_SCRIPTS/tigervnc.sh \
    && $INST_SCRIPTS/tini.sh \
    && $INST_SCRIPTS/no_vnc.sh \
    && $HOME/install/others.sh \
    && $INST_SCRIPTS/xfce_ui.sh
    
ADD .config/GUI/xfce/ $HOME/

############### Configure startup Dugong
ADD .config/scripts /dockerstartup
RUN find /dockerstartup -name '*.sh' -exec chmod a+x {} + \
    && /dockerstartup/generate_container_user.sh \
    && $HOME/install/set_user_permission.sh /dockerstartup $HOME
ADD .config/scripts/.bashrc $HOME/.bashrc

VOLUME ["/data", "/config"]
RUN chown -R dugong:dugong /data && \
    chown -R dugong:dugong /config

ENTRYPOINT ["tini", "--"]
ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--tail-log"]

WORKDIR /data
USER dugong
