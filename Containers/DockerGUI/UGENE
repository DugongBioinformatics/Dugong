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

FROM bigscience/dugong
MAINTAINER Fabiano Menegidio

################### Add repository UGENE
RUN add-apt-repository ppa:iefremov/ppa

################### Install dependences UGENE
RUN apt-get update \
    && apt-get install -y libc6 libgcc1 libgl1-mesa-glx libqt4-network \
	  && libqt4-opengl libqt4-script libqt4-svg libqt4-xml libqtcore4 \
	  && libqtgui4 libqtwebkit4 libsqlite3-0 libstdc++6 libx11-6 zlib1g

################### Install UGENE
RUN apt-get install -y ugene \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/root/scripts/vnc_startup.sh"]
CMD ["--tail-log"]
