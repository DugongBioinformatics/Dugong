
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

FROM dugong/dugong-xfce
MAINTAINER Fabiano Menegidio

################### Install geWorkbench
WORKDIR /root/
RUN wget wget https://cbiit-download.nci.nih.gov/geworkbench/releases/2.6.0/geWorkbench_v2.6.0_Linux_JRE7_x64.bin \
    && mkdir /root/geWorkbench \
    && mv /root/geWorkbench_v2.6.0_Linux_JRE7_x64.bin /root/geWorkbench \
    && chmod +x /root/geWorkbench/geWorkbench_v2.6.0_Linux_JRE7_x64.bin \
    && /bin/bash sh /root/geWorkbench/geWorkbench_v2.6.0_Linux_JRE7_x64.bin
    
VOLUME ["/data", "/config"]

ENTRYPOINT ["tini", "--"]
ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--tail-log"]
